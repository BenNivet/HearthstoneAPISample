//  SearchPresenter.swift
//  HearthstoneAPISample
//
//  Created by Benjamin CANTE on 22/04/2019.
//  Copyright © 2019 com.Nivet. All rights reserved.
//

import Foundation

class SearchPresenter: NSObject {
    
    // MARK: - Attributes
    
    weak var view: SearchViewControllerProtocol?
    var manager: SearchManagerProtocol!
    
    var searchViewModel = SearchViewModel()
    
    // MARK: - Functions
    
    init(view: SearchViewControllerProtocol, manager: SearchManagerProtocol) {
        self.view = view
        self.manager = manager
    }
}

extension SearchPresenter: SearchPresenterProtocol {

    func viewDidLoad() {
        view?.configureComponents()
    }
    
    func search() {
        if let name = searchViewModel.name {
            searchCards(name: name)
        }
    }
    
    private func searchCards(name: String) {
        view?.showLoader()
        manager.getCards(by: name, success: { results in
            
            self.manager.save(cards: results)
            self.view?.performToGallery(with: results)
            
            self.view?.hideLoader()
        }, failure: { error in
            if let error = error {
                Logger.error(error.localizedDescription)
            }
            self.view?.hideLoader()
        })
    }
}
