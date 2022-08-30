//
//  String+Extension.swift
//  Taste on way
//
//  Created by KhaleD HuSsien on 30/08/2022.
//

import Foundation
extension String{
    var asURL: URL?{
        return URL(string: self)
    }
}
