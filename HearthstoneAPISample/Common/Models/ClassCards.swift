//
//  ClassCards.swift
//  HearthstoneAPISample
//
//  Created by Benjamin CANTE on 21/04/2019.
//  Copyright © 2019 com.Nivet. All rights reserved.
//

import Foundation

class ClassCards {
    var title: String?
    var cards: [Card]?
    
    init(title: String, cards: [Card]?) {
        self.title = title
        self.cards = cards
    }
}

