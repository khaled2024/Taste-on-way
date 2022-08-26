//
//  UiView+Extension.swift
//  Taste on way
//
//  Created by KhaleD HuSsien on 26/08/2022.
//

import UIKit

extension UIView {
    @IBInspectable var cornerRadius: CGFloat{
        get{
            return self.cornerRadius
        }
        set{
            self.layer.cornerRadius = newValue
        }
    }
}
