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
    
    func configure(for urlImg: String?) {
        activityIndicator.startAnimating()
        DispatchQueue.global().async {
            if let urlString = urlImg,
                let url = URL(string: urlString),
                let data = try? Data(contentsOf: url),
                let image = UIImage(data: data) {
                DispatchQueue.main.async {
                    self.image = image
                    self.activityIndicator.stopAnimating()
                }
            } else {
                DispatchQueue.main.async {
                    self.image = UIImage(named: "defaultCard")
                    self.activityIndicator.stopAnimating()
                }
            }
        }
    }
}
