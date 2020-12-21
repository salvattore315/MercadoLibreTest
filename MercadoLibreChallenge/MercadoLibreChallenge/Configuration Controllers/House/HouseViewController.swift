//
//  HouseViewController.swift
//  MercadoLibreChallenge
//
//  Created by Salvador Martinez on 19/12/20.
//

import UIKit

class HouseViewController: BaseViewController {
    
    //MARK: - Variable & IBOutlet
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var buyButton: UIButton!
    
    private var itemsSearched = ""
    private let presenter = HousePresenter()

    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        searchBar.delegate = self
        presenter.attachView(view: self)
        
    }
    
    //MARK: - Setup
    override func setup() {
        tabBarItem.title = "start".localized
        searchBar.backgroundImage = UIImage()
        searchBar.searchTextField.backgroundColor = .white
        searchBar.placeholder = "searchBarMeli".localized
        searchBar.searchTextField.font = .systemFont(ofSize: 15, weight: .light)
        searchBar.searchTextField.textColor = .systemGray2
        searchBar.searchTextField.clearButtonMode = .never
    }
    
    //MARK: - Actions
    //For show the screen only search
    private func presentOnlySearchViewController() {
        let storyboard = UIStoryboard(name: GlobalConstants.ViewControllers.main, bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: GlobalConstants.Segues.onlySearch) as! OnlySearchViewController
        vc.delegate = self
        self.present(vc, animated: false)
    }
    
    //MARK: - Segues
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination is SearchViewController {
            let vc = segue.destination as? SearchViewController
            vc?.itemSearched = self.itemsSearched
        }
    }
}

extension HouseViewController: UISearchBarDelegate {
    //MARK: - SearchBarDelegates
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        presentOnlySearchViewController()
    }
}

extension HouseViewController: OnlySearchViewControllerDelegate {
    //MARK: - OnlySearchViewControllerDelegate
    func didSelectedItems(items: String) {
        self.itemsSearched = items
        if(!(itemsSearched.isEmpty)) {
            self.performSegue(withIdentifier: GlobalConstants.Segues.goToSearch, sender: nil)
        }
    }
}

extension HouseViewController: BaseServiceView {
    
    //MARK: - Presenter Methods
    func startCallingService() {
        
    }
    
    func finishCallService() {
        
    }
    
    func setResponse(objectCodable: Any) {
        
    }
    
    func setEmpty() {
        
    }
    
    func setError(error: String?) {
        
    }
    
    
}
