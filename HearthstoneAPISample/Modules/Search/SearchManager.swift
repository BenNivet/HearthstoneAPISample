//  SearchManager.swift
//  HearthstoneAPISample
//
//  Created by Benjamin CANTE on 22/04/2019.
//  Copyright © 2019 com.Nivet. All rights reserved.
//

import Foundation

class SearchManager: SearchManagerProtocol {
    
    deinit {
        Session.current?.appContext[Context.Gallery.cards]  = nil
    }

    func getCards(by name: String, success: @escaping ([Card]?) -> Void, failure: @escaping (Error?) -> Void) {
        CardsProvider().getCardsSearch(name: name, success: success, failure: failure)
    }
    
    func filterCards(unfilteredCards: [Card]?) -> [Card]? {
        guard let allCards = Session.current?.appContext[Context.Home.cards] as? [Card] else { return nil }
        
        return unfilteredCards?.filter { allCards.contains($0) }
    }
    
    func save(cards: [Card]?) {
        Session.current?.appContext[Context.Gallery.cards] = cards
    }
}
