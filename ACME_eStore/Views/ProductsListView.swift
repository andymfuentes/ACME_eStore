//
//  ProductsListView.swift
//  ACME-eStore
//
//  Created by Andy Fuentes on 2022-10-31.
//

import SwiftUI

struct ProductsListView: View {
  @ObservedObject var productVM: ProductViewModel
  var body: some View {
    ZStack {
      BackgroundView()
      ProductsCategoryView(productVM: productVM)
    }
  }
}

struct BackgroundView: View {
  var body: some View {
    RoundedRectangle(cornerRadius: 12.0)
      .strokeBorder(lineWidth: 3)
      .foregroundColor(Color("WelcomeBorderColor"))
  }
}

struct ListOfProducts: View {
  @ObservedObject var productVM: ProductViewModel
  var body: some View {
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
}

struct ProductsCategoryView: View {
  @ObservedObject var productVM: ProductViewModel
  var body: some View {
    NavigationView {
      ListOfProducts(productVM: productVM)
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

struct ProductsListView_Previews: PreviewProvider {
    static var previews: some View {
        ProductsListView(productVM: ProductViewModel())
    }
}
