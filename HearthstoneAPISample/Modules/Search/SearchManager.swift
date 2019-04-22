//  SearchManager.swift
//  HearthstoneAPISample
//
//  Created by Benjamin CANTE on 22/04/2019.
//  Copyright © 2019 com.Nivet. All rights reserved.
//

import Foundation

class SearchManager: SearchManagerProtocol {

    func getCards(by name: String, success: @escaping ([Card]?) -> Void, failure: @escaping (Error?) -> Void) {
        CardsProvider().getCardsSearch(name: name, success: success, failure: failure)
    }
    
    func save(cards: [Card]?) {
        Session.current?.appContext[Context.Gallery.cards] = cards
    }
}
