//  CardsGalleryPresenterTests.swift
//  HearthstoneAPISample
//
//  Created by Benjamin CANTE on 21/04/2019.
//  Copyright © 2019 com.Nivet. All rights reserved.
//

import XCTest
@testable import HearthstoneAPISample

class CardsGalleryPresenterTests: XCTestCase {
    
    var view: CardsGalleryViewMock!
    var presenter: CardsGalleryPresenter!
    var manager: CardsGalleryManagerMock!
    
    // MARK: Set Up
    override func setUp() {
        super.setUp()
        
        view = CardsGalleryViewMock()
        manager = CardsGalleryManagerMock()
        presenter = CardsGalleryPresenter(view: view, manager: manager)
    }
    
    // MARK: Unit Tests
    // MARK: viewDidLoad Tests
    func testViewDidLoadCardsNil() {
        presenter.viewDidLoad()
        
        XCTAssertTrue(view.registerCollectionCellCalled)
        XCTAssertTrue(manager.cardsCalled)
        XCTAssertTrue(view.configureResultsLabelCalled)
        XCTAssertTrue(view.hudShow)
        XCTAssertTrue((view.reloadCalled))
    }
    
    func testViewDidLoadCardsNotNil() {
        manager.classCards = [CardUtils.constructCard(playerClass: "class1")]
        presenter.viewDidLoad()
        
        XCTAssertTrue(view.registerCollectionCellCalled)
        XCTAssertTrue(manager.cardsCalled)
        XCTAssertTrue(view.configureResultsLabelCalled)
        XCTAssertFalse(view.hudShow)
        XCTAssertTrue((view.reloadCalled))
    }
}
