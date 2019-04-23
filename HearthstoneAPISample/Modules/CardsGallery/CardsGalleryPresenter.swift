//  CardsGalleryPresenter.swift
//  HearthstoneAPISample
//
//  Created by Benjamin CANTE on 20/04/2019.
//  Copyright © 2019 com.Nivet. All rights reserved.
//

import Foundation

class CardsGalleryPresenter: NSObject {
    
    // MARK: - Attributes
    
    weak var view: CardsGalleryViewControllerProtocol?
    var manager: CardsGalleryManagerProtocol!
    
    var cards: [Card]?
    var cardsView: [String]? {
        didSet {
            view?.configureResultsLabel(show: cardsView?.isEmpty ?? true)
        }
    }
    
    // MARK: - Functions
    
    init(view: CardsGalleryViewControllerProtocol, manager: CardsGalleryManagerProtocol) {
        self.view = view
        self.manager = manager
    }
}

extension CardsGalleryPresenter: CardsGalleryPresenterProtocol {

    func viewDidLoad() {
        view?.registerCollectionCell(for: CardsGallery.CollectionViewCellIdentifiers.identifier)
        
        cards = manager.cards()
        filterCards()
        
        view?.reload()
    }
    
    private func filterCards() {
        cardsView = cards?.compactMap { $0.img }
    }
}
