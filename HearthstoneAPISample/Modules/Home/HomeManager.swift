//  HomeManager.swift
//  HearthstoneAPISample
//
//  Created by Benjamin CANTE on 18/04/2019.
//  Copyright © 2019 com.Nivet. All rights reserved.
//

import Foundation

class HomeManager: HomeManagerProtocol {
    
    deinit {
        Session.current?.appContext[Context.Home.cards]  = nil
        Session.current?.appContext[Context.Gallery.cards]  = nil
    }
    
    func getCards(success: @escaping (Cards?) -> Void, failure: @escaping (Error?) -> Void) {
        CardsProvider().getAllCards(success: success, failure: failure)
    }
    
    func saveClassCards(cards: [Card]?) {
        Session.current?.appContext[Context.Gallery.cards] = cards
    }
    
    func save(cards: [Card]?) {
        Session.current?.appContext[Context.Home.cards] = cards
    }
    
    func prepareLoadingImageUrl(urls: [String]?) {
        DispatchQueue.global().async {
            urls?.forEach {
                ImagesManager.shared.getCardImage(urlString: $0, completion: nil)
            }
        }
    }
    
    // Not working, try using https://stackoverflow.com/questions/27021896/nsurlsession-concurrent-requests-with-alamofire or RX to manage request
//    func prepareLoadingCardsDetails(ids: [String]?) {
//        DispatchQueue.global().async {
//            ids?.forEach {
//                CardsProvider().getCard(name: $0, success: { card in
//                    Logger.info(card?.description ?? "")
//                }, failure: { error in
//                    Logger.error("Error - \(error?.localizedDescription ?? "")")
//                })
//            }
//        }
//    }
}
