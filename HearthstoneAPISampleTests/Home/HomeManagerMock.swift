//  HomeManagerMock.swift
//  HearthstoneAPISample
//
//  Created by Benjamin CANTE on 18/04/2019.
//  Copyright © 2019 com.Nivet. All rights reserved.
//

import Foundation
@testable import HearthstoneAPISample

class HomeManagerMock {
    
    var getCardsCalled = false
    var saveCalled = false
    var prepareLoadingImageUrlCalled = false
    
    var success = true
    var cards: Cards?
    var error: Error?
}

extension HomeManagerMock: HomeManagerProtocol {
    
    func getCards(success: @escaping (Cards?) -> Void, failure: @escaping (Error?) -> Void) {
        getCardsCalled = true
        
        if self.success {
            success(cards)
        } else {
            failure(error)
        }
    }
    
    func save(cards: [Card]?) {
        saveCalled = true
    }
    
    func prepareLoadingImageUrl(urls: [String]) {
        prepareLoadingImageUrlCalled = true
    }
}
