//
//  UIColor+Hex.swift
//  HearthstoneAPISample
//
//  Created by Benjamin CANTE on 20/04/2019.
//  Copyright © 2019 com.Nivet. All rights reserved.
//

import UIKit

extension UIColor {
    convenience init(hexString: String) {
        let cString: String = hexString.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        let scanner            = Scanner(string: cString)
        
        if hexString.hasPrefix("#") {
            scanner.scanLocation = 1
        }
        
        var color: UInt32 = 0
        scanner.scanHexInt32(&color)
        
        let mask = 0x000000FF
        let r = Int(color >> 16) & mask
        let g = Int(color >> 8) & mask
        let b = Int(color) & mask
        
        let red   = CGFloat(r) / 255.0
        let green = CGFloat(g) / 255.0
        let blue  = CGFloat(b) / 255.0
        
        self.init(red: red, green: green, blue: blue, alpha: 1)
    }
}
