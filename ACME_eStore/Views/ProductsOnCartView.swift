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
    NavigationView{
      ZStack {
        BackgroundView()
        ProductsOnCartList()
          .sheet(isPresented: $productVM.showPaymentDialog, content: {
            PaymentDialogView(productVM: productVM)
          })
      }
    }
  }
  
  func ProductsOnCartList() -> some View {
    List{
      ForEach(productVM.cartItems){ product in
        ZStack{
          RoundedRectangle(cornerRadius: 8.0)
            .strokeBorder(lineWidth: 1)
            .foregroundColor(Color("WelcomeBorderColor"))
          HStack{
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
      ZStack{
        BackgroundView().font(.title)
          .frame( height: 40)
        HStack{
          Text("Total Price :")
          Text("$ \(productVM.getTotalPriceOnCart() , specifier: "%.02f")")
          PayButtonView()
        }
      }
    }
  }
  
  func PayButtonView()-> some View {
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

struct ProductsOnCartView_Previews: PreviewProvider {
  static var previews: some View {
    ProductsOnCartView(productVM: ProductViewModel())
  }
}
