//  CardsGalleryInterface.swift
//  HearthstoneAPISample
//
//  Created by Benjamin CANTE on 20/04/2019.
//  Copyright © 2019 com.Nivet. All rights reserved.
//

import Foundation

extension Context {
    enum Gallery: Key, StringEnum {
        case cards
    }
}

struct CardsGallery {
    struct Constants {
        static let tableName = "CardsGallery"
    }
    
    struct StoryboardIdentifiers {
        static let cardsGallery = "CardsGallery"
    }
    
    struct CollectionViewCellIdentifiers {
        static let identifier = "CardCollectionViewCell"
    }
}

protocol CardsGalleryPresenterProtocol: class {
    var cardsView: [String]? { get set }
    func viewDidLoad()
}

protocol CardsGalleryViewControllerProtocol: LoadableProtocol {
    func registerCollectionCell(for identifier: String)
    func configureResultsLabel(show: Bool)
    func reload()
}

protocol CardsGalleryManagerProtocol: class {
    func cards() -> [Card]?
}
