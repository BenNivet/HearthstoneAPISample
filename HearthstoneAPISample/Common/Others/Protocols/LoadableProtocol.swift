//
//  LoadableProtocol.swift
//  HearthstoneAPISample
//
//  Created by Benjamin CANTE on 18/04/2019.
//  Copyright © 2019 com.Nivet. All rights reserved.
//

import UIKit

protocol LoadableProtocol: class {
    func showLoader()
    func hideLoader()
}

extension LoadableProtocol where Self: UIViewController {
    func showLoader() {
        Loader.increment()
    }
    
    func hideLoader() {
        Loader.decrement()
    }
}
