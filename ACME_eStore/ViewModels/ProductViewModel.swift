//
//  ProductViewModel.swift
//  ACME-eStore
//
//  Created by Andy Fuentes on 2022-10-31.
//

import SwiftUI
import Combine

class ProductViewModel: ObservableObject{
  
  @Published var showProductDetails = false   // flag ProductDetailsView
  @Published var selectedProduct : Product = Product.example
  
  @Published var showPaymentDialog = false    // flag PaymentDialogView
  
  @Published var cartItems: [Product] = []
  @Published var selectedProductCategory: String = ""
  @Published var productCategory: [String] = []
  
  @Published public var isDisplayingError = false
  @Published public var lastErrorMessage = "" {
    didSet { isDisplayingError = true }
  }
  
  @Published var products: [Product] = []   // products cache
  public let network = Network()
}

extension ProductViewModel {
  
  func delete(at offsets: IndexSet) {
    cartItems.remove(atOffsets: offsets)
  }
  func getTotalPriceOnCart()->Double{
    var total = 0.0
    for item  in cartItems{
      total += item.price
    }
    return total
  }
  
  @MainActor // ensures the property connected can be updated only on main thread
  public func checkNetwork() {
    if !network.connected {
      lastErrorMessage = Constants.NetworkError.networkErrorMsg
    }
  }
  
  @MainActor // ensures the property lastErrorMessage can be updated only on main thread
  func getProductsAndCategories()  {
    Thread.sleep(forTimeInterval: 1)
    checkNetwork()
    Task {
      do{
        try await downloadProducts()
      }catch{
        print(error)
        lastErrorMessage = error.localizedDescription
      }
      do{
        try await downloadCategories()
      }catch{
        print(error)
        lastErrorMessage = error.localizedDescription
      }
      if !productCategory.isEmpty {
        selectedProductCategory = productCategory[0]
      }
    }
  }
  
  @MainActor  // ensures the property products can be updated only on main thread
  func downloadProducts() async throws -> Void {
    checkNetwork()
    guard let url =  URL(string: Constants.URL.productsURLString) else {
      throw Constants.ProductStoreError.urlCreationFailed
    }
    let (data, response) = try await URLSession.shared.data(from: url)
    
    guard let httpResponse = response as? HTTPURLResponse,
          (200..<300).contains(httpResponse.statusCode)
    else {
      throw Constants.ProductStoreError.requestFailed
    }
    products =  try JSONDecoder().decode([Product].self, from: data)
    if products.isEmpty { throw Constants.ProductStoreError.responseDecodingFailed }
  }
  
  @MainActor // ensures the property productCategory can be updated only on main thread
  func downloadCategories() async throws -> Void {
    checkNetwork()
    guard let url =  URL(string: Constants.URL.categoriesURLString) else {
      throw Constants.ProductStoreError.urlCreationFailed
    }
    let (data, response) = try await URLSession.shared.data(from: url)
    
    guard let httpResponse = response as? HTTPURLResponse,
          (200..<300).contains(httpResponse.statusCode)
    else {
      throw Constants.ProductStoreError.requestFailed
    }
    productCategory =  try JSONDecoder().decode([String].self, from: data)
    if productCategory.isEmpty { throw Constants.ProductStoreError.responseDecodingFailed }
  }
}
  
