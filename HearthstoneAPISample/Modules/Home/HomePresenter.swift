//  HomePresenter.swift
//  HearthstoneAPISample
//
//  Created by Benjamin CANTE on 18/04/2019.
//  Copyright © 2019 com.Nivet. All rights reserved.
//

import Foundation

class HomePresenter: NSObject {
    
    // MARK: - Attributes
    
    weak var view: HomeViewControllerProtocol?
    var manager: HomeManagerProtocol!
    
    var classCards: [ClassCards]?
    
    // MARK: - Functions
    
    init(view: HomeViewControllerProtocol, manager: HomeManagerProtocol) {
        self.view = view
        self.manager = manager
    }
}

extension HomePresenter: HomePresenterProtocol {

    func viewDidLoad() {
        
        view?.configureComponents()
        view?.registerCell(for: Home.CellIdentifier.identifier)
        
        view?.showLoader()
        
        manager.getCards(success: { result in
            self.view?.hideLoader()
            
            let allCards = (result?.basic ?? []) + (result?.classic ?? [])
            let allClass = Array(Set(allCards.map { $0.playerClass }))
            
            let cardsFiltered = allClass.map { (className) -> (String, [Card]) in (className ?? "", allCards.filter { $0.playerClass == className }) }
            
            self.classCards = cardsFiltered.map { ClassCards(title: $0.0, cards: $0.1) }
            
            self.view?.reload()
            self.manager.prepareLoadingImageUrl(urls: allCards.compactMap { $0.img })
            
        }, failure: { error in
            if let error = error {
                Logger.error(error.localizedDescription)
            }
            self.view?.hideLoader()
        })
    }
    
    func selectedClass(at index: Int) {
        if let classCards = classCards,
            classCards.indices.contains(index) {
            manager.save(cards: classCards[index].cards)
            view?.performToGallery(with: classCards[index].cards)
        }
    }
}
