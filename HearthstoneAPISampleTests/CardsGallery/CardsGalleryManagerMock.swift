//  CardsGalleryManagerMock.swift
//  HearthstoneAPISample
//
//  Created by Benjamin CANTE on 21/04/2019.
//  Copyright © 2019 com.Nivet. All rights reserved.
//

import Foundation
@testable import HearthstoneAPISample

class CardsGalleryManagerMock {
    var cardsCalled = false
    
    var classCards: [Card]?
}

extension CardsGalleryManagerMock: CardsGalleryManagerProtocol {
    
    func cards() -> [Card]? {
        cardsCalled = true
        return classCards
    }
}
