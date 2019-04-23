//  HomeInterface.swift
//  HearthstoneAPISample
//
//  Created by Benjamin CANTE on 18/04/2019.
//  Copyright © 2019 com.Nivet. All rights reserved.
//

import Foundation

enum SetType {
    case basic
    case classic
}

struct Home {
    struct Constants {
        static let tableName = "Home"
    }
    
    struct StoryboardIdentifiers {
        static let home = "Home"
    }
    
    struct CellIdentifier {
        static let identifier = "ClassTableViewCell"
    }
}

protocol HomePresenterProtocol: class {
    var classCards: [ClassCards]? { get set }
    func viewDidLoad()
    func selectedClass(at index: Int)
}

protocol HomeViewControllerProtocol: LoadableProtocol {
    func configureComponents()
    func registerCell(for identifier: String)
    func performToGallery(with cards: [Card]?)
    func reload()
}

protocol HomeManagerProtocol: class {
    func getCards(success: @escaping (Cards?) -> Void, failure: @escaping (Error?) -> Void)
    func save(cards: [Card]?)
    func prepareLoadingImageUrl(urls: [String])
}
