//  TabBarViewMock.swift
//  HearthstoneAPISample
//
//  Created by Benjamin CANTE on 22/04/2019.
//  Copyright © 2019 com.Nivet. All rights reserved.
//

import UIKit
@testable import HearthstoneAPISample

class TabBarViewMock: UIViewController {
	var configureCoontrollersCalled = false
}

// MARK: - TabBarViewControllerProtocol
extension TabBarViewMock: TabBarControllerProtocol {
    
    func configureCoontrollers(vcIds: [String]) {
        configureCoontrollersCalled = true
    }
}
