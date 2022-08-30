//
//  Dish.swift
//  Taste on way
//
//  Created by KhaleD HuSsien on 30/08/2022.
//

import Foundation
struct Dish {
    let id,name,image,description : String?
    let calories: Int?
    
    var formattedCalories: String{
        return "\(calories ?? 0) calories"
    }
}
