//
//  ApiResponse.swift
//  Taste on way
//
//  Created by KhaleD HuSsien on 31/08/2022.
//

import Foundation
struct ApiResponse<T:Codable>: Codable {
    let status: Int
    let message: String?
    let data: T?
    let error: String?
}
