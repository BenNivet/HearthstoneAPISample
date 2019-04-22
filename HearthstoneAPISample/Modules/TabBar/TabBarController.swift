//  TabBarController.swift
//  HearthstoneAPISample
//
//  Created by Benjamin CANTE on 22/04/2019.
//  Copyright © 2019 com.Nivet. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {
	
	// MARK: - Attributes
	lazy var presenter: TabBarPresenterProtocol = TabBarPresenter(view: self)
    
    // MARK: - IBOutlets
}

// MARK: - Functions
extension TabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
    }
}

// MARK: - TabBarViewControllerProtocol
extension TabBarController: TabBarControllerProtocol {
    
    func configureCoontrollers(vcIds: [String]) {
        viewControllers = vcIds.compactMap {
            UIStoryboard(name: $0, bundle: nil).instantiateInitialViewController() as? UINavigationController
        }
    }
}
