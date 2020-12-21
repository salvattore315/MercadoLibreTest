//
//  OnlySearchViewController.swift
//  MercadoLibreChallenge
//
//  Created by Salvador Martinez on 20/12/20.
//
import UIKit

protocol OnlySearchViewControllerDelegate: class {
    func didSelectedItems(items: String)
}

class OnlySearchViewController: BaseViewController {
    
    //MARK: - Variable & IBOutlet
    @IBOutlet weak var searchBar: UISearchBar!
    weak public var delegate: OnlySearchViewControllerDelegate?
    
    private let presenter = OnlySearchPresenter()

    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        searchBar.delegate = self
        presenter.attachView(view: self)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        searchBar.becomeFirstResponder()
    }
    
    //MARK: - Setup
    override func setup() {
        searchBar.backgroundImage = UIImage()
        searchBar.searchTextField.backgroundColor = .white
        searchBar.placeholder = "searchBarMeli".localized
        searchBar.searchTextField.font = .systemFont(ofSize: 15, weight: .light)
        searchBar.searchTextField.textColor = .systemGray2
    }
    
    
}

extension OnlySearchViewController: UISearchBarDelegate {
    
    //MARK: - SearchBarDelegates
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        self.dismiss(animated: true) {
            self.delegate?.didSelectedItems(items: searchBar.text ?? "")
            searchBar.resignFirstResponder()
        }
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        self.dismiss(animated: true, completion: nil)
    }
}

extension OnlySearchViewController: BaseServiceView {
    
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
