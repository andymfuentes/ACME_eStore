//
//  Product.swift
//  ACME-eStore
//
//  Created by Andy Fuentes on 2022-10-31.
//

import Foundation

struct Product: Codable, Identifiable {
  let id: Int
  var title: String?
  var price: Double
  var category: String?
  var description: String?
  var image: String?
  static var example: Product {
    Product(
      id: 1,
      title: "Title",
      price: 123.33,
      category: "Category",
      description: "Description",
      image: Constants.URL.sampleImage
    )
  }
}
