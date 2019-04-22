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
    var configureResultsLabelCalled = false
    var reloadCalled = false
    var hudShow = true
}

// MARK: - CardsGalleryViewControllerProtocol
extension CardsGalleryViewMock: CardsGalleryViewControllerProtocol {
    
    func registerCollectionCell(for identifier: String) {
        registerCollectionCellCalled = true
    }
    
    func configureResultsLabel(show: Bool) {
        configureResultsLabelCalled = true
        hudShow = show
    }
    
    func reload() {
        reloadCalled = true
    }
}
