//
//  Theme.swift
//  HearthstoneAPISample
//
//  Created by Benjamin CANTE on 20/04/2019.
//  Copyright © 2019 com.Nivet. All rights reserved.
//

import UIKit

enum MainColorEnum: String {
    case G1                     = "333333"
    case G2                     = "666666"
    case G3                     = "999999"
    case G4                     = "CCCCCC"
    case G5                     = "F5F5F5"
    case G6                     = "F9F9FB"
}

enum AppColorEnum: String {
    case AC1        = "051e3e"
}

enum RainbowColorEnum: String {
    case RC1        = "009f4d"
    case RC2        = "84bd00"
    case RC3        = "efdf00"
    case RC4        = "fe5000"
    case RC5        = "e4002b"
    case RC6        = "da1884"
    case RC7        = "a51890"
    case RC8        = "0077c8"
    case RC9        = "48a9c5"
    case RC10       = "0085ad"
    case RC11       = "8db9ca"
    case RC12       = "4298b5"
}

public class Theme {
    
    // MARK: - Colors
    public static let G1 = UIColor(hexString: MainColorEnum.G1.rawValue)
    public static let G2 = UIColor(hexString: MainColorEnum.G2.rawValue)
    public static let G3 = UIColor(hexString: MainColorEnum.G3.rawValue)
    public static let G4 = UIColor(hexString: MainColorEnum.G4.rawValue)
    public static let G5 = UIColor(hexString: MainColorEnum.G5.rawValue)
    public static let G6 = UIColor(hexString: MainColorEnum.G6.rawValue)
    
    public static let AC1 = UIColor(hexString: AppColorEnum.AC1.rawValue)
    
    public static let RC1 = UIColor(hexString: RainbowColorEnum.RC1.rawValue)
    public static let RC2 = UIColor(hexString: RainbowColorEnum.RC2.rawValue)
    public static let RC3 = UIColor(hexString: RainbowColorEnum.RC3.rawValue)
    public static let RC4 = UIColor(hexString: RainbowColorEnum.RC4.rawValue)
    public static let RC5 = UIColor(hexString: RainbowColorEnum.RC5.rawValue)
    public static let RC6 = UIColor(hexString: RainbowColorEnum.RC6.rawValue)
    public static let RC7 = UIColor(hexString: RainbowColorEnum.RC7.rawValue)
    public static let RC8 = UIColor(hexString: RainbowColorEnum.RC8.rawValue)
    public static let RC9 = UIColor(hexString: RainbowColorEnum.RC9.rawValue)
    public static let RC10 = UIColor(hexString: RainbowColorEnum.RC10.rawValue)
    public static let RC11 = UIColor(hexString: RainbowColorEnum.RC11.rawValue)
    public static let RC12 = UIColor(hexString: RainbowColorEnum.RC12.rawValue)
    
    public static let RainbowColorArray = [RC1, RC2, RC3, RC4, RC5, RC6, RC7, RC8, RC9, RC10, RC11, RC12]
}
