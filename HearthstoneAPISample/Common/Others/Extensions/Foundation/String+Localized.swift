//
//  String+Localized.swift
//  HearthstoneAPISample
//
//  Created by Benjamin CANTE on 18/04/2019.
//  Copyright © 2019 com.Nivet. All rights reserved.
//

import Foundation

extension String {
    var localized: String {
        return NSLocalizedString(self, comment: "")
    }
    
    func localized(inTable tableName: String) -> String {
        return NSLocalizedString(self, tableName: tableName, bundle: .main, value: "", comment: "")
    }
}
