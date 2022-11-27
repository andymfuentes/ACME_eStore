//
//  ContentView.swift
//  ACME-eStore
//
//  Created by Andy Fuentes on 2022-10-31.
//

import SwiftUI

struct ContentView: View {
  @StateObject var productVM = ProductViewModel()
  var body: some View {
    
    TabView {
      HomeScreenView()
        .tabItem {
          Label("Home", systemImage: "house")
        }
      ProductsListView(productVM: productVM)
        .tabItem {
          Label("Shop", systemImage: "list.dash")
        }
      ProductsOnCartView(productVM: productVM)
        .tabItem {
          Label("Cart", systemImage: "cart.fill")
        }
    }
    .statusBar(hidden: true)
    .onAppear {
      productVM.getProductsAndCategories()
    }
  }
}

//      .onAppear {
//        productVM.network.startNetworkMonitor()
//        productVM.getProductsAndCategories()
//      }  // prompt / alert if network error
//      .alert("Error", isPresented: $productVM.isDisplayingError, actions: {
//        Button("Continue...", role: .cancel) {
//          productVM.getProductsAndCategories()
//        }
//      }, message: {
//        Text(productVM.lastErrorMessage)
//      })

  


struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView(productVM: ProductViewModel())
  }
}
