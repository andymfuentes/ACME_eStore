//
//  ProductsOnCartView.swift
//  ACME-eStore
//
//  Created by Andy Fuentes on 2022-10-31.
//

import SwiftUI

struct ProductsOnCartView: View {
  @ObservedObject var productVM: ProductViewModel
  var body: some View {
    NavigationView {
      ZStack {
        BackgroundView()
        productsOnCartList()
          .sheet(isPresented: $productVM.showPaymentDialog, content: {
            PaymentDialogView(productVM: productVM)
          })
      }
    }
  }
}

struct ProductsOnCartView_Previews: PreviewProvider {
  static var previews: some View {
    ProductsOnCartView(productVM: ProductViewModel())
  }
}
