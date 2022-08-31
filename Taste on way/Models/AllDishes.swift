//
//  AllDishes.swift
//  Taste on way
//
//  Created by KhaleD HuSsien on 31/08/2022.
//

import Foundation
struct AllDishes: Codable {
    let categories: [DishCategory]?
    let populars: [Dish]?
    let specials: [Dish]?
}
