//
//  ProductsOnCartView.Extensions.swift
//  ACME_eStore
//
//  Created by Andy Fuentes on 2022-11-27.
//

import SwiftUI

extension ProductsOnCartView {
 
  func productsOnCartList() -> some View {
    List {
      ForEach(productVM.cartItems) { product in
        ZStack {
          RoundedRectangle(cornerRadius: 8.0)
            .strokeBorder(lineWidth: 1)
            .foregroundColor(Color("WelcomeBorderColor"))
          HStack {
            Text(product.title!).bold().font(.caption)
            Divider()
            ProductImage(productVM: productVM, url: product.image!)
              .frame(width: 45, height: 45)
            Divider()
            Text("$ \(product.price, specifier: "%.02f")")
              .bold()
              .font(.footnote)
              .frame(width: 80, height: 50)
          }
        }
      }.onDelete(perform: productVM.delete)
      ZStack {
        BackgroundView().font(.title)
          .frame( height: 40)
        HStack {
          Text("Total Price :")
          Text("$ \(productVM.getTotalPriceOnCart(), specifier: "%.02f")")
          payButtonView()
        }
      }
    }
  }
  func payButtonView()-> some View {
    Button(action: {
      productVM.showPaymentDialog = true
    }, label: {
      Text("Pay")
        .font(.footnote)
        .foregroundColor(Color("TextColor"))
    })
    .background(Color("WelcomeBorderColor"))
    .buttonBorderShape(.roundedRectangle)
    .buttonStyle(.bordered)
    .controlSize(.regular)
  }
}
