//
//  ProductDetailsView.swift
//  ACME-eStore
//
//  Created by Andy Fuentes on 2022-10-31.
//

import SwiftUI

struct ProductDetailsView: View {
  @ObservedObject var productVM: ProductViewModel
  var body: some View {
    ZStack{
      BackgroundView()
      VStack{
        ProductImage(productVM: productVM, url: productVM.selectedProduct.image!)
          .frame(width: 120, height: 120, alignment: .center)
        HStack{
          Text(productVM.selectedProduct.title!)
            .font(.title2).bold().foregroundColor(Color("TextColor"))
            .multilineTextAlignment(.leading)
        }
        Divider()
        Text(productVM.selectedProduct.description!)
          .font(.footnote).bold().foregroundColor(Color("TextColor"))
          .multilineTextAlignment(.leading).padding()
        Divider()
        HStack{
          Text("$ \(productVM.selectedProduct.price, specifier: "%.02f")")
            .bold().font(.title2).foregroundColor(Color("TextColor"))
            .multilineTextAlignment(.leading)
          CartButtonView(productVM: productVM)
        }
      }
    }
  }
}

struct CartButtonView : View {
  let productVM : ProductViewModel
  var body: some View{
    Button(action: {
      productVM.cartItems.append(productVM.selectedProduct)
      productVM.showProductDetails = false
    }, label: {
      Text("Add to cart")
        .font(.footnote)
        .foregroundColor(Color("TextColor"))
    })
    .background(Color("WelcomeBorderColor"))
    .buttonBorderShape(.roundedRectangle)
    .buttonStyle(.bordered)
    .controlSize(.regular)
  }
}

struct ProductDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailsView(productVM: ProductViewModel())
    }
}
