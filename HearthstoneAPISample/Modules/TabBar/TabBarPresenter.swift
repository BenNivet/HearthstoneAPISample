//  TabBarPresenter.swift
//  HearthstoneAPISample
//
//  Created by Benjamin CANTE on 22/04/2019.
//  Copyright © 2019 com.Nivet. All rights reserved.
//

import Foundation

class TabBarPresenter: NSObject {
    
    // MARK: - Attributes
    
    weak var view: TabBarControllerProtocol?
    
    // MARK: - Functions
    
    init(view: TabBarControllerProtocol) {
        self.view = view
    }
}

extension TabBarPresenter: TabBarPresenterProtocol {

    func viewDidLoad() {
        view?.configureComponents()
    }
}
