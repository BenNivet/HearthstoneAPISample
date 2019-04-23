//  SearchManagerMock.swift
//  HearthstoneAPISample
//
//  Created by Benjamin CANTE on 22/04/2019.
//  Copyright © 2019 com.Nivet. All rights reserved.
//

import Foundation
@testable import HearthstoneAPISample

class SearchManagerMock {
    var getCardsCalled = false
    var filterCardsCalled = false
    var saveCalled = false
    
    var success = true
    var cards: [Card]?
    var error: Error?
}

extension SearchManagerMock: SearchManagerProtocol {
    
    func getCards(by name: String, success: @escaping ([Card]?) -> Void, failure: @escaping (Error?) -> Void) {
        getCardsCalled = true
        
        if self.success {
            success(cards)
        } else {
            failure(error)
        }
    }
    
    func filterCards(unfilteredCards: [Card]?) -> [Card]? {
        filterCardsCalled = true
        return cards
    }
    
    func save(cards: [Card]?) {
        saveCalled = true
    }
}
