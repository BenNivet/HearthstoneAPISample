//  HomeViewMock.swift
//  HearthstoneAPISample
//
//  Created by Benjamin CANTE on 18/04/2019.
//  Copyright © 2019 com.Nivet. All rights reserved.
//

import UIKit
@testable import HearthstoneAPISample

class HomeViewMock: UIViewController {
    
	var configureComponentsCalled = false
    var registerCellCalled = false
    var performToGalleryCalled = false
    var reloadCalled = false
    
    var showLoaderCalled = false
    var hideLoaderCalled = false
}

// MARK: - HomeViewControllerProtocol
extension HomeViewMock: HomeViewControllerProtocol {
    
    func configureComponents() {
        configureComponentsCalled = true
    }
    
    func registerCell(for identifier: String) {
        registerCellCalled = true
    }
    
    func performToGallery(with cards: [Card]?) {
        performToGalleryCalled = true
    }
    
    func reload() {
        reloadCalled = true
    }
}

// MARK: - HomeViewControllerProtocol
extension HomeViewMock: LoadableProtocol {
    
    func showLoader() {
        showLoaderCalled = true
    }
    
    func hideLoader() {
        hideLoaderCalled = true
    }
}
