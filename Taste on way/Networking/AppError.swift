//
//  AppError.swift
//  Taste on way
//
//  Created by KhaleD HuSsien on 31/08/2022.
//

import Foundation
enum AppError: LocalizedError {
    case errorDecoding
    case unKnownError
    case invalidURL
    case serverError(String)
    var errorDescription: String?{
        switch self {
        case .errorDecoding:
            return "Response could not be response"
        case .unKnownError:
            return "Bruhh..!! I have no idea what go on"
        case .invalidURL:
            return "No vaild url..!"
        case .serverError(let error):
            return error
        }
    }
    
}
