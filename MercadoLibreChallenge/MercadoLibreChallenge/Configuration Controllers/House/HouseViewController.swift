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
    }
    
    //MARK: - Segues
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination is SearchViewController {
            let vc = segue.destination as? SearchViewController
            vc?.itemSearched = searchBar.text ?? ""
        }
    }
}

extension HouseViewController: UISearchBarDelegate {
    
    //MARK: - SearchBarDelegates
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if(!(searchBar.text?.isEmpty ?? true)) {
            self.performSegue(withIdentifier: GlobalConstants.Segues.goToSearch, sender: nil)
        }
        searchBar.resignFirstResponder()
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
