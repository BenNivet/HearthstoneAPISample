//
//  SetView.swift
//  HearthstoneAPISample
//
//  Created by Benjamin CANTE on 21/04/2019.
//  Copyright © 2019 com.Nivet. All rights reserved.
//

import UIKit

@IBDesignable
class SetView: DesignableView {

    // MARK: IBOutlets
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var cardImageView: UIImageView!
    
    // MARK: IBInspectable
    @IBInspectable var title: String? {
        didSet { self.titleLabel.text = title }
    }

    @IBInspectable var image: UIImage? {
        didSet { self.cardImageView.image = image }
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
    
    // MARK: Constants
    private let kCornerRadius: CGFloat  = 40
    private let kborderWidth: CGFloat   = 1

    // MARK: Functions
    override func xibSetup() {
        super.xibSetup()
        
        titleLabel.textColor = Theme.AC1
        titleLabel.font = UIFont.systemFont(ofSize: 20)
        
        borderColor = Theme.AC1
        cornerRadius = kCornerRadius
        borderWidth = kborderWidth
        
        backgroundColor = Theme.G5
    }
}
