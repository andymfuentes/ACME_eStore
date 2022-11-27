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
      ProductsCategoryView()
    }
  }
}


struct ProductsListView_Previews: PreviewProvider {
    static var previews: some View {
        ProductsListView(productVM: ProductViewModel())
    }
}
