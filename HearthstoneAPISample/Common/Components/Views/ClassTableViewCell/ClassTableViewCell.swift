//
//  ClassTableViewCell.swift
//  HearthstoneAPISample
//
//  Created by Benjamin CANTE on 21/04/2019.
//  Copyright © 2019 com.Nivet. All rights reserved.
//

import UIKit

@IBDesignable
class ClassTableViewCell: UITableViewCell {

    // MARK: - IBOutlets
    @IBOutlet weak var titleLabel: UILabel!
    
    // MARK: IBInspectable
    @IBInspectable var title: String? {
        didSet { self.titleLabel.text = title }
    }

    // MARK: - Cell Functions
    override func awakeFromNib() {
        super.awakeFromNib()
        
        titleLabel.textColor = Theme.AC1
        tintColor = Theme.AC1
    }
    
    // MARK: - Functions
    func configure(with title: String, color: UIColor) {
        self.title = title
        backgroundColor = color
    }
}
