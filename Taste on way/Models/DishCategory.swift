//
//  DishCategory.swift
//  Taste on way
//
//  Created by KhaleD HuSsien on 30/08/2022.
//

import Foundation
struct DishCategory: Codable {
    let id,name,image: String?
    enum CodingKeys: String,CodingKey {
        case id
        case name =  "title"
        case image
    }
}
