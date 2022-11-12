//
//  ContentView.swift
//  ACME-eStore
//
//  Created by Andy Fuentes on 2022-10-31.
//

import SwiftUI

struct ContentView: View {
  @ObservedObject var productVM: ProductViewModel
  var body: some View {
    displayTabView()
      .statusBar(hidden: true)
      .onAppear {
        productVM.network.startNetworkMonitor()
        productVM.getProductsAndCategories()
      }  // prompt / alert if network error
      .alert("Error", isPresented: $productVM.isDisplayingError, actions: {
        Button("Continue...", role: .cancel) {
          productVM.getProductsAndCategories()
        }
      }, message: {
        Text(productVM.lastErrorMessage)
      })
  }
  func displayTabView()-> some View {
    TabView {
      HomeScreenView().frame(width: 200, height: 200, alignment: .center)
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
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView(productVM: ProductViewModel())
  }
}
