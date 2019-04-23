//  HomeViewController.swift
//  HearthstoneAPISample
//
//  Created by Benjamin CANTE on 18/04/2019.
//  Copyright © 2019 com.Nivet. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
	
	// MARK: - Attributes
	lazy var presenter: HomePresenterProtocol = HomePresenter(view: self, manager: HomeManager())
    
    // MARK: - IBOutlets
    @IBOutlet weak var tableView: UITableView!
}

// MARK: - Functions
extension HomeViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
    }
}

// MARK: - HomeViewControllerProtocol
extension HomeViewController: HomeViewControllerProtocol {
    
    func configureComponents() {
        navigationController?.navigationBar.topItem?.title = "TITLE".localized(inTable: Home.Constants.tableName)
    }
    
    func registerCell(for identifier: String) {
        let nib = UINib(nibName: identifier, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: identifier)
    }
    
    func performToGallery(with cards: [Card]?) {
        let galleryId = CardsGallery.StoryboardIdentifiers.cardsGallery
        
        if let vc = UIStoryboard(name: galleryId, bundle: nil).instantiateInitialViewController() as? CardsGalleryViewController {
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    func reload() {
        tableView.reloadData()
    }
}

// MARK: - UITableViewDatasource
extension HomeViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.classCards?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let identifier = Home.CellIdentifier.identifier
        guard let classCards = presenter.classCards,
            classCards.indices.contains(indexPath.row),
            let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as? ClassTableViewCell else {
                return UITableViewCell()
        }
        
        let classCard = classCards[indexPath.row]
        cell.configure(with: classCard.title ?? "",
                       color: Theme.RainbowColorArray[indexPath.row % Theme.RainbowColorArray.count])
        return cell
    }
}

// MARK: - UITableViewDelegate
extension HomeViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.selectedClass(at: indexPath.row)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
