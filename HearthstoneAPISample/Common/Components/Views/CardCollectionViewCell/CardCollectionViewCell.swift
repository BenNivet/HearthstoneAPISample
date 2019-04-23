//
//  CardCollectionViewCell.swift
//  HearthstoneAPISample
//
//  Created by Benjamin CANTE on 21/04/2019.
//  Copyright © 2019 com.Nivet. All rights reserved.
//

import UIKit

@IBDesignable
class CardCollectionViewCell: UICollectionViewCell {
    
    // MARK: IBOutlets
    @IBOutlet weak var cardImageView: UIImageView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    // MARK: IBInspectable
    @IBInspectable var image: UIImage? {
        didSet { self.cardImageView.image = image }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configure(for urlImg: String) {
        image = UIImage(named: "defaultCard")
        activityIndicator.startAnimating()
        DispatchQueue.global().async {
            ImagesManager.shared.getImage(urlString: urlImg, completion: { image in
                DispatchQueue.main.async {
                    if let image = image {
                        self.image = image
                    } else {
                        self.image = UIImage(named: "defaultCard")
                    }
                    self.activityIndicator.stopAnimating()
                }
            })
        }
    }
}
