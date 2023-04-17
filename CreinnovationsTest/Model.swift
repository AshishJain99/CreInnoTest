//
//  Model.swift
//  CreinnovationsTest
//
//  Created by sixpep on 17/04/23.
//

import Foundation

struct ApiResponse: Codable {
    let categories: [Category]?
}

struct Category: Codable {
    let CategoryName: String?
    let categoryImage: String?
    let categoryTitle: String?
    let subcategories: [Subcategory]?

    enum CodingKeys: String, CodingKey {
        case CategoryName
        case categoryImage, categoryTitle, subcategories
    }
}

struct Subcategory: Codable {
    let id: String?
    let backlayer: String?
    let frontlayer: String?
    let thumbnail: String?
    let topfrontlayer: String?
}
