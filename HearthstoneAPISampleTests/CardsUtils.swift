//
//  CardsUtils.swift
//  HearthstoneAPISampleTests
//
//  Created by Benjamin CANTE on 22/04/2019.
//  Copyright © 2019 com.Nivet. All rights reserved.
//

import Foundation
@testable import HearthstoneAPISample

class CardUtils {
    class func constructCard(playerClass: String) -> Card {
        let card = Card()
        card.playerClass = playerClass
        
        return card
    }
}

