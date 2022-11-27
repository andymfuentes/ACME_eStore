//
//  ProductsListView.Extensions.swift
//  ACME_eStore
//
//  Created by Andy Fuentes on 2022-11-27.
//

import SwiftUI

extension ProductsListView {
func ListOfProducts()-> some View {
    List {
      ForEach( productVM.products ) { product in
        if product.category == productVM.selectedProductCategory {
          ProductView(productVM: productVM, product: product)
            .onTapGesture {  // show ProductDetailsView
              productVM.showProductDetails = true
              productVM.selectedProduct = product
            }
        }
      }
      .sheet(isPresented: $productVM.showProductDetails, content: {
        ProductDetailsView(productVM: productVM)
      })
    }
  }


func ProductsCategoryView() ->  some View {
    NavigationView {
      ListOfProducts()
        .navigationTitle(productVM.selectedProductCategory.uppercased())
        .font(.title)
        .foregroundColor(Color("TextColor"))
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
          ToolbarItem {
            Menu("Category") {
              ForEach(productVM.productCategory, id: \.self) { name in
                Button(name) {
                  productVM.selectedProductCategory = name
                }
              }
            }
          }
        }
    }
  }
}
