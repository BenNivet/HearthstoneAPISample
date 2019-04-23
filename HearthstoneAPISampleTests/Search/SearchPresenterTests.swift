//  SearchPresenterTests.swift
//  HearthstoneAPISample
//
//  Created by Benjamin CANTE on 22/04/2019.
//  Copyright © 2019 com.Nivet. All rights reserved.
//

import XCTest
@testable import HearthstoneAPISample

class SearchPresenterTests: XCTestCase {
    
    var view: SearchViewMock!
    var presenter: SearchPresenter!
    var manager: SearchManagerMock!
    
    // MARK: Set Up
    override func setUp() {
        super.setUp()
        
        view = SearchViewMock()
        manager = SearchManagerMock()
        presenter = SearchPresenter(view: view, manager: manager)
    }
    
    // MARK: Unit Tests
    // MARK: viewDidLoad Tests
    func testViewDidLoad() {
        presenter.viewDidLoad()
        
        XCTAssertTrue(view.configureComponentsCalled)
    }
    
    // MARK: search Tests
    func testSearchNameNil() {
        presenter.search()
        
        XCTAssertFalse(manager.getCardsCalled)
        XCTAssertFalse(manager.filterCardsCalled)
        XCTAssertFalse(manager.saveCalled)
        XCTAssertFalse(view.performToGalleryCalled)
    }
    
    func testSearchNameNotNilSuccess() {
        presenter.searchViewModel.name = "name"
        presenter.search()
        
        XCTAssertTrue(manager.getCardsCalled)
        XCTAssertTrue(manager.filterCardsCalled)
        XCTAssertTrue(manager.saveCalled)
        XCTAssertTrue(view.performToGalleryCalled)
    }
    
    func testSearchNameNotNilErrorNil() {
        presenter.searchViewModel.name = "name"
        manager.success = false
        presenter.search()
        
        XCTAssertTrue(manager.getCardsCalled)
        XCTAssertFalse(manager.filterCardsCalled)
        XCTAssertFalse(manager.saveCalled)
        XCTAssertFalse(view.performToGalleryCalled)
    }
    
    func testSearchNameNotNilErrorNotNil() {
        presenter.searchViewModel.name = "name"
        manager.error = TestError.defaultError
        manager.success = false
        presenter.search()
        
        XCTAssertTrue(manager.getCardsCalled)
        XCTAssertFalse(manager.filterCardsCalled)
        XCTAssertFalse(manager.saveCalled)
        XCTAssertFalse(view.performToGalleryCalled)
    }
    
}
