//
//  Constants.swift
//  ACME-eStore
//
//  Created by Andy Fuentes on 2022-10-31.
//

import Foundation

enum Constants {
  enum URL {
    static let sampleImage = "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg"
    static let quote = "https://programming-quotes-api.herokuapp.com/Quotes/random"
    public static let productsURLString: String = "https://fakestoreapi.com/products"
    public static let categoriesURLString: String = "https://fakestoreapi.com/products/categories"
  }

  enum NetworkError {
    public static let networkErrorMsg = "no internet connection"
  }
   enum ProductStoreError: Error {
    case requestFailed
    case responseDecodingFailed
    case urlCreationFailed
  }
}
