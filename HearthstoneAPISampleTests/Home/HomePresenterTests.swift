//  HomePresenterTests.swift
//  HearthstoneAPISample
//
//  Created by Benjamin CANTE on 18/04/2019.
//  Copyright © 2019 com.Nivet. All rights reserved.
//

import XCTest
@testable import HearthstoneAPISample

class HomePresenterTests: XCTestCase {
    
    var view: HomeViewMock!
    var presenter: HomePresenter!
    var manager: HomeManagerMock!
    
    // MARK: Set Up
    override func setUp() {
        super.setUp()
        
        view = HomeViewMock()
        manager = HomeManagerMock()
        presenter = HomePresenter(view: view, manager: manager)
    }
    
    // MARK: Unit Tests
    
    // MARK: viewDidLoad Tests
    func testPresenterSuccessCardsNil() {
        presenter.viewDidLoad()
        
        XCTAssertTrue(view.configureComponentsCalled)
        XCTAssertTrue(view.registerCellCalled)
        
        XCTAssertTrue(view.showLoaderCalled)
        
        XCTAssertTrue(manager.getCardsCalled)
        XCTAssertTrue(view.reloadCalled)
        
        XCTAssertTrue(view.hideLoaderCalled)
    }
    
    func testPresenterSuccessCardsNotNil() {
        let cards = Cards()
        cards.basic = [CardUtils.constructCard(playerClass: "class1")]
        manager.cards = cards
        presenter.viewDidLoad()
        
        XCTAssertTrue(view.configureComponentsCalled)
        XCTAssertTrue(view.registerCellCalled)
        
        XCTAssertTrue(view.showLoaderCalled)
        
        XCTAssertTrue(manager.getCardsCalled)
        XCTAssertTrue(manager.prepareLoadingImageUrlCalled)
        XCTAssertTrue(view.reloadCalled)
        
        XCTAssertTrue(view.hideLoaderCalled)
    }
    
    func testPresenterFailureErrorNil() {
        manager.success = false
        presenter.viewDidLoad()
        
        XCTAssertTrue(view.configureComponentsCalled)
        XCTAssertTrue(view.registerCellCalled)
        
        XCTAssertTrue(view.showLoaderCalled)
        
        XCTAssertTrue(manager.getCardsCalled)
        XCTAssertFalse(manager.prepareLoadingImageUrlCalled)
        XCTAssertFalse(view.reloadCalled)
        
        XCTAssertTrue(view.hideLoaderCalled)
    }
    
    func testPresenterFailureErrorNotNil() {
        manager.success = false
        manager.error = TestError.defaultError
        presenter.viewDidLoad()
        
        XCTAssertTrue(view.configureComponentsCalled)
        XCTAssertTrue(view.registerCellCalled)
        
        XCTAssertTrue(view.showLoaderCalled)
        
        XCTAssertTrue(manager.getCardsCalled)
        XCTAssertFalse(manager.prepareLoadingImageUrlCalled)
        XCTAssertFalse(view.reloadCalled)
        
        XCTAssertTrue(view.hideLoaderCalled)
    }
    
    // MARK: selectedClass Tests
    func testSelectedClassValidIndex() {
        presenter.classCards = [ClassCards(title: "class1",
                                           cards: [CardUtils.constructCard(playerClass: "class1")])]
        presenter.selectedClass(at: 0)
        
        XCTAssertTrue(manager.saveCalled)
        XCTAssertTrue(view.performToGalleryCalled)
    }
    
    func testSelectedClassInvalidIndex1() {
        presenter.classCards = [ClassCards(title: "class1",
                                           cards: [CardUtils.constructCard(playerClass: "class1")])]
        presenter.selectedClass(at: 4)
        
        XCTAssertFalse(manager.saveCalled)
        XCTAssertFalse(view.performToGalleryCalled)
    }
    
    func testSelectedClassInvalidIndex2() {
        presenter.selectedClass(at: 0)
        
        XCTAssertFalse(manager.saveCalled)
        XCTAssertFalse(view.performToGalleryCalled)
    }
    
    func testSelectedClassInvalidIndex3() {
        presenter.selectedClass(at: -4)
        
        XCTAssertFalse(manager.saveCalled)
        XCTAssertFalse(view.performToGalleryCalled)
    }
}
