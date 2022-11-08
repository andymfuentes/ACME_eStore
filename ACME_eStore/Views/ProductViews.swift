//
//  ProductViews.swift
//  ACME-eStore
//
//  Created by Andy Fuentes on 2022-10-31.
//

import SwiftUI

struct ProductView : View {
  @ObservedObject var productVM : ProductViewModel
  var product : Product
  var body: some View {
    ZStack{
      BackgroundView()
      VStack{
        Text("\(product.id)")
          .italic()
          .font(.caption)
          .foregroundColor(.gray)
          .multilineTextAlignment(.leading)
        HStack{
          Text("\(product.title!)")
            .bold()
            .font(.footnote)
            .foregroundColor(Color("TextColor"))
            .multilineTextAlignment(.center)
          ProductImage(productVM: productVM, url: product.image!)
            .frame(width: 80, height: 80)
        }
        Text("$ \(product.price, specifier: "%.02f")")
          .bold()
          .font(.caption)
          .foregroundColor(Color("TextColor"))
          .multilineTextAlignment(.leading)
      }
      .padding()
    }
  }
}

struct ProductImage: View {
  @ObservedObject var productVM : ProductViewModel
  var url: String
  var body: some View {
    
    AsyncImage(url: URL(string: url)){ phase in
      if let image = phase.image {
          image.resizable()
      }else {
        ProgressView().onAppear() { productVM.checkNetwork() }      }
    }
  }
}






// ******************************************
// ** after this line, for content preview use only **
struct ProductViews: View {
  var body: some View {
    Product.example
  }
}

extension Product : View {
  var body: some View {
    ZStack{
      BackgroundView()
      VStack{
        Text("\(self.id)")
          .italic()
          .font(.caption)
          .foregroundColor(.gray)
          .multilineTextAlignment(.leading)
        HStack{
          Text("\(self.title!)")
            .bold()
            .font(.footnote)
            .foregroundColor(Color("TextColor"))
            .multilineTextAlignment(.center)
          Rectangle().frame(width: 80, height: 80)
        }
        Text("$ \(self.price, specifier: "%.02f")")
          .bold()
          .font(.caption)
          .foregroundColor(Color("TextColor"))
          .multilineTextAlignment(.leading)
      }
      .padding()
    }
  }
}

struct ProductViews_Previews: PreviewProvider {
  static var previews: some View {
    ProductViews()
  }
}
