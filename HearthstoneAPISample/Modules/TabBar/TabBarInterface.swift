//  TabBarInterface.swift
//  HearthstoneAPISample
//
//  Created by Benjamin CANTE on 22/04/2019.
//  Copyright © 2019 com.Nivet. All rights reserved.
//

import Foundation

struct TabBar {
    struct Constants {
        static let tableName = "TabBar"
    }
    
    struct SegueIdentifiers {
        
    }
}

protocol TabBarPresenterProtocol: class {
    func viewDidLoad()
}

protocol TabBarControllerProtocol: class {
    func configureComponents()
}
