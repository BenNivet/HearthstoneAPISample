//  SearchInterface.swift
//  HearthstoneAPISample
//
//  Created by Benjamin CANTE on 22/04/2019.
//  Copyright © 2019 com.Nivet. All rights reserved.
//

import Foundation

struct Search {
    struct Constants {
        static let tableName = "Search"
    }
    
    struct StoryboardIdentifiers {
        static let search = "Search"
    }
}

protocol SearchPresenterProtocol: class {
    var searchViewModel: SearchViewModel { get set }
    func viewDidLoad()
    func search()
}

protocol SearchViewControllerProtocol: LoadableProtocol {
    func configureComponents()
    func performToGallery(with cards: [Card]?)
}

protocol SearchManagerProtocol: class {
    func getCards(by name: String, success: @escaping ([Card]?) -> Void, failure: @escaping (Error?) -> Void)
    func save(cards: [Card]?)
}
