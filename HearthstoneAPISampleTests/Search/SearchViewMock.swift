//  SearchViewMock.swift
//  HearthstoneAPISample
//
//  Created by Benjamin CANTE on 22/04/2019.
//  Copyright © 2019 com.Nivet. All rights reserved.
//

import UIKit
@testable import HearthstoneAPISample

class SearchViewMock: UIViewController {
    var configureComponentsCalled = false
    var performToGalleryCalled = false
}

// MARK: - SearchViewControllerProtocol
extension SearchViewMock: SearchViewControllerProtocol {
    
    func configureComponents() {
        configureComponentsCalled = true
    }
    
    func performToGallery(with cards: [Card]?) {
        performToGalleryCalled = true
    }
}
