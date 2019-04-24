//  SearchViewController.swift
//  HearthstoneAPISample
//
//  Created by Benjamin CANTE on 22/04/2019.
//  Copyright © 2019 com.Nivet. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {
	
	// MARK: - Attributes
	lazy var presenter: SearchPresenterProtocol = SearchPresenter(view: self, manager: SearchManager())
    
    // MARK: - IBOutlets
    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    
    // MARK: - IBActions
    @IBAction func search() {
        prepareToSearch()
    }
}

// MARK: - Functions
extension SearchViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
    }
}

// MARK: - SearchViewControllerProtocol
extension SearchViewController: SearchViewControllerProtocol {
    
    func configureComponents() {
        navigationController?.navigationBar.topItem?.title = "TITLE".localized(inTable: Search.Constants.tableName)
        mainLabel.text = "MAIN_LABEL_TITLE".localized(inTable: Search.Constants.tableName)
    }
    
    func performToGallery(with cards: [Card]?) {
        let galleryId = CardsGallery.StoryboardIdentifiers.cardsGallery
        
        if let vc = UIStoryboard(name: galleryId, bundle: nil).instantiateInitialViewController() as? CardsGalleryViewController {
            navigationController?.pushViewController(vc, animated: true)
        }
        
        updateView()
    }
    
    private func prepareToSearch() {
        presenter.searchViewModel.name = nameTextField.text
        presenter.search()
    }
    
    private func updateView() {
        nameTextField.text = presenter.searchViewModel.name
    }
}

// MARK: - UITextFieldDelegate
extension SearchViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == nameTextField,
            let text = textField.text {
            if !text.isEmpty {
                _ = nameTextField.resignFirstResponder()
                prepareToSearch()
            }
        }
        
        return true
    }
}
