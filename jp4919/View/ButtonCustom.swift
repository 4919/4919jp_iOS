//
//  Custom_buttom.swift
//  jp4919
//
//  Created by shogo-ka on 2018/07/29.
//  Copyright © 2018年 shogo-ka. All rights reserved.
//

import UIKit

@IBDesignable
class ButtonCustom: UIButton {
    
    @IBInspectable var textColor: UIColor?
    
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            layer.cornerRadius = cornerRadius
        }
    }
    
    @IBInspectable var borderWidth: CGFloat = 0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable var borderColor: UIColor = UIColor.clear {
        didSet {
            layer.borderColor = borderColor.cgColor
        }
    }
}
