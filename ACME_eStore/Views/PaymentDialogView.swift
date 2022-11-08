//
//  PaymentDialogView.swift
//  ACME-eStore
//
//  Created by Andy Fuentes on 2022-11-01.
//

import SwiftUI

struct PaymentDialogView: View {
  let productVM: ProductViewModel

  var body: some View {
    List{
      HStack{
        ZStack{
          BackgroundView()
          Text("Check Out")
            .font(.system(size: 21.0))
            .foregroundColor(Color.black).multilineTextAlignment(.center)
        }
      }
      CardDetailTextEntry()
      ZStack{
        BackgroundView()
        VStack{
          Text("Payment Amount $ \(productVM.getTotalPriceOnCart() , specifier: "%.02f")")
          ConfirmationButtonView(productVM: productVM)
        }.padding()
      }
    }
  }
}

struct CardDetailTextEntry: View{
  @State var nameOnCardText: String = ""
  @State var cardNumberText: String = ""
  @State var expiryDateText: String = ""
  @State var _3DigitCodeText: String = ""
  
  var body: some View{
    ZStack{
      BackgroundView()
      VStack(alignment: .leading) {
        TextField("Enter Card Number", text: $cardNumberText).keyboardType(.numberPad)
          .font(.callout)

        Divider()
        TextField("Name on Card: ", text: $nameOnCardText)
          .font(.callout)

        Divider()
        TextField("00/00 Expiration Date", text: $expiryDateText).keyboardType(.numberPad)
          .font(.callout)
       
          .textFieldStyle(RoundedBorderTextFieldStyle())
        Divider()

        TextField("000 3 digit code :", text: $_3DigitCodeText).keyboardType(.numberPad)
          .font(.callout)
          .textFieldStyle(RoundedBorderTextFieldStyle())
      }.padding()
    }
  }
}

struct ConfirmationButtonView : View {
  let productVM : ProductViewModel
  var body: some View{
    Button(action: {
      productVM.showPaymentDialog = false
      productVM.cartItems = []
    }, label: {
      Text("PAY")
        .font(.footnote)
        .foregroundColor(.red)
    })
    .frame(width: 150, height: 20, alignment: .center)
    .background(Color("WelcomeBorderColor"))
    .buttonBorderShape(.roundedRectangle)
    .buttonStyle(.bordered)
    .controlSize(.regular)
  }
}

struct PaymentDialogView_Previews: PreviewProvider {
    static var previews: some View {
        PaymentDialogView(productVM: ProductViewModel())
    }
}
