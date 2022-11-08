//
//  ACME_eStoreApp.swift
//  ACME-eStore
//
//  Created by Andy Fuentes on 2022-10-31.
//

import SwiftUI

@main
struct AppMain: App {
  public var productVM = ProductViewModel()
   var body: some Scene {
        WindowGroup {
          ContentView(productVM: productVM)
        }
    }
}
