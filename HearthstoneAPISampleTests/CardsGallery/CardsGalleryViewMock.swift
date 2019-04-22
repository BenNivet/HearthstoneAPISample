//  CardsGalleryViewMock.swift
//  HearthstoneAPISample
//
//  Created by Benjamin CANTE on 21/04/2019.
//  Copyright © 2019 com.Nivet. All rights reserved.
//

import UIKit
@testable import HearthstoneAPISample

class CardsGalleryViewMock: UIViewController {
    
	var registerCollectionCellCalled = false
    var reloadCalled = false
}

// MARK: - CardsGalleryViewControllerProtocol
extension CardsGalleryViewMock: CardsGalleryViewControllerProtocol {
    
    func registerCollectionCell(for identifier: String) {
        registerCollectionCellCalled = true
    }
    
    func reload() {
        reloadCalled = true
    }
}
