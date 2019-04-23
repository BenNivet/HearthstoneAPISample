//  HomeManager.swift
//  HearthstoneAPISample
//
//  Created by Benjamin CANTE on 18/04/2019.
//  Copyright © 2019 com.Nivet. All rights reserved.
//

import Foundation

class HomeManager: HomeManagerProtocol {
    
    deinit {
        Session.current?.appContext[Context.Gallery.cards]  = nil
    }
    
    func getCards(success: @escaping (Cards?) -> Void, failure: @escaping (Error?) -> Void) {
        CardsProvider().getAllCards(success: success, failure: failure)
    }
    
    func save(cards: [Card]?) {
        Session.current?.appContext[Context.Gallery.cards] = cards
    }
    
    func prepareLoadingImageUrl(urls: [String]?) {
        DispatchQueue.global().async {
            urls?.forEach {
                ImagesManager.shared.getCardImage(urlString: $0, completion: nil)
            }
        }
    }
}
