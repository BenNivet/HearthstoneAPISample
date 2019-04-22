//  TabBarPresenterTests.swift
//  HearthstoneAPISample
//
//  Created by Benjamin CANTE on 22/04/2019.
//  Copyright © 2019 com.Nivet. All rights reserved.
//

import XCTest
@testable import HearthstoneAPISample

class TabBarPresenterTests: XCTestCase {
    
    var view: TabBarViewMock!
    var presenter: TabBarPresenter!
    
    // MARK: Set Up
    override func setUp() {
        super.setUp()
        
        view = TabBarViewMock()
        presenter = TabBarPresenter(view: view)
    }
    
    // MARK: Unit Tests
    func testViewDidLoad() {
        presenter.viewDidLoad()
        
        XCTAssertTrue(view.configureCoontrollersCalled)
    }
}
