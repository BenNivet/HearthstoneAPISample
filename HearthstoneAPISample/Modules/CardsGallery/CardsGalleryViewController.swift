//  CardsGalleryViewController.swift
//  HearthstoneAPISample
//
//  Created by Benjamin CANTE on 20/04/2019.
//  Copyright © 2019 com.Nivet. All rights reserved.
//

import UIKit

class CardsGalleryViewController: UIViewController {
	
	// MARK: - Attributes
	lazy var presenter: CardsGalleryPresenterProtocol = CardsGalleryPresenter(view: self, manager: CardsGalleryManager())
    
    // MARK: - IBOutlets
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var noResultsLabel: UILabel!
}

// MARK: - Functions
extension CardsGalleryViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
    }
}

// MARK: - CardsGalleryViewControllerProtocol
extension CardsGalleryViewController: CardsGalleryViewControllerProtocol {
    
    func registerCollectionCell(for identifier: String) {
        let nib = UINib(nibName: identifier, bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: identifier)
    }
    
    func configureResultsLabel(show: Bool) {
        noResultsLabel.isHidden = !show
    }
    
    func reload() {
        collectionView.reloadData()
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension CardsGalleryViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.bounds.width/2.0 - 20
        let height = width * 1.3
        
        return CGSize(width: width, height: height)
    }
}

// MARK: - UICollectionViewDataSource
extension CardsGalleryViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter.cardsView?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CardsGallery.CollectionViewCellIdentifiers.identifier, for: indexPath) as? CardCollectionViewCell,
            let cardUrl =  presenter.cardsView?[indexPath.row] else {
                return UICollectionViewCell()
        }
        
        cell.configure(for: cardUrl)
        
        return cell
    }
}
