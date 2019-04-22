//
//  DesignableButton.swift
//  HearthstoneAPISample
//
//  Created by Benjamin CANTE on 20/04/2019.
//  Copyright © 2019 com.Nivet. All rights reserved.
//

import UIKit

private let kCornerRadius: CGFloat  = 4
private let kborderWidth: CGFloat   = 1

@IBDesignable
class DesignableButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureComponent()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configureComponent()
    }
    
    func configureComponent() {
        titleLabel?.font = UIFont.systemFont(ofSize: 20)
        isUserInteractionEnabled = true
        backgroundColor = Theme.AC1
        setTitleColor(.white, for: .normal)
        cornerRadius = kCornerRadius
        borderWidth = 0
    }
    
    @IBInspectable
    var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
        }
    }
    
    @IBInspectable
    var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }
    
    @IBInspectable
    var borderColor: UIColor? {
        get {
            if let color = layer.borderColor {
                return UIColor(cgColor: color)
            }
            return nil
        }
        set {
            if let color = newValue {
                layer.borderColor = color.cgColor
            } else {
                layer.borderColor = nil
            }
        }
    }
}
