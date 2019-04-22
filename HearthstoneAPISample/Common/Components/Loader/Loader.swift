//
//  Loader.swift
//  HearthstoneAPISample
//
//  Created by Benjamin CANTE on 21/04/2019.
//  Copyright © 2019 com.Nivet. All rights reserved.
//

import UIKit

class Loader {
    private static let shared = Loader()
    
    private var counter = 0
    private var hud: UIActivityIndicatorView?
    private var isDisplayed = false
    
    private static let kSize = 100.0
    
    deinit {
        hud?.removeFromSuperview()
    }
    
    class func increment() {
        shared.counter += 1
        shared.toggleIfNeeded()
    }
    
    class func decrement() {
        shared.counter -= 1
        shared.toggleIfNeeded()
    }
    
    class func forceHide() {
        shared.forceHide()
    }
    
    init() {
        if let mainWindow = UIApplication.shared.delegate?.window as? UIView {
            self.showOn(mainWindow)
        }
    }
}

// MARK: Private methods

extension Loader {
    
    private func showOn(_ view: UIView) {
        hud = UIActivityIndicatorView()
        if let hud = hud {
            hud.frame.size = CGSize(width: Loader.kSize, height: Loader.kSize)
            hud.center = view.center
            hud.backgroundColor = Theme.AC1.withAlphaComponent(0.5)
                hud.style = UIActivityIndicatorView.Style.whiteLarge
            hud.layer.cornerRadius = 10
            view.addSubview(hud)
        }
        toggleIfNeeded()
    }
    
    private func toggleIfNeeded() {
        if counter == 0 {
            hideLoader()
        }
        else if counter > 0 && !isDisplayed {
            showLoader()
        }
        else if counter < 0 {
            Logger.error("Loader is mis-implemented (\(counter))")
        }
    }
    
    private func forceHide() {
        counter = 0
        toggleIfNeeded()
    }
    
    private func showLoader() {
        guard let hud = hud, let superView = hud.superview else { return }
        
        hud.startAnimating()
        hud.alpha = 0
        superView.bringSubviewToFront(hud)
        UIView.animate(withDuration: 0.3, animations: {
            hud.alpha = 1
        }, completion: { _ in
            self.isDisplayed = true
        })
    }
    
    private func hideLoader() {
        guard let hud = hud else { return }
        
        isDisplayed = false
        UIView.animate(withDuration: 0.3, animations: {
            hud.alpha = 0
            hud.stopAnimating()
        })
    }
}
