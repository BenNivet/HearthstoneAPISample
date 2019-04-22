//  CardsGalleryManager.swift
//  HearthstoneAPISample
//
//  Created by Benjamin CANTE on 20/04/2019.
//  Copyright © 2019 com.Nivet. All rights reserved.
//

import Foundation

class CardsGalleryManager: CardsGalleryManagerProtocol {

    func cards() -> [Card]? {
        return Session.current?.appContext[Context.Gallery.cards] as? [Card]
    }
}
