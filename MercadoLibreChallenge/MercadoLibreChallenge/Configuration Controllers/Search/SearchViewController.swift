//
//  SearchViewController.swift
//  MercadoLibreChallenge
//
//  Created by Salvador Martinez on 20/12/20.
//

import UIKit

class SearchViewController: BaseViewController {

    //MARK: - Variable & IBOutlet
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var buyButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var magnifyingglassImageView: UIImageView!
    @IBOutlet weak var noFindLabel: UILabel!
    @IBOutlet weak var searchOtherLabel: UILabel!
    
    public var itemSearched: String = ""
    private var itemsSearchedOnlySearch = ""
    private var items: [ItemSearched] = []
    private var itemSearchedObject: ItemSearched?
    private let presenter = SearchPresenter()
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.attachView(view: self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if(items.isEmpty) {
            presenter.getItemsService(itemSearched: itemSearched)
        }
    }

    //MARK: - Setup
    internal override func setup() {
        super.setup()
        searchBar.backgroundImage = UIImage()
        searchBar.searchTextField.backgroundColor = .white
        searchBar.placeholder = "searchBarMeli".localized
        searchBar.searchTextField.font = .systemFont(ofSize: 15, weight: .light)
        searchBar.searchTextField.textColor = .systemGray2
        searchBar.text = itemSearched
        searchBar.showsSearchResultsButton = false
        
        noFindLabel.text = "notFind".localized
        searchOtherLabel.text = "searchAnother".localized
    }
    
    //MARK: - Actions
    @IBAction func backPress(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    //For show the screen only search
    private func presentOnlySearchViewController() {
        let storyboard = UIStoryboard(name: GlobalConstants.ViewControllers.main, bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: GlobalConstants.Segues.onlySearch) as! OnlySearchViewController
        vc.delegate = self
        self.present(vc, animated: true)
    }
    
    //For show a new screen of search
    private func presentSearchViewController() {
        let storyboard = UIStoryboard(name: GlobalConstants.ViewControllers.main, bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: GlobalConstants.Segues.searchItem) as! SearchViewController
        vc.itemSearched = itemsSearchedOnlySearch
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    //MARK: - Segues
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination is SearchDetailViewController {
            let vc = segue.destination as? SearchDetailViewController
            vc?.itemSearched = itemSearchedObject
        }
    }
}

extension SearchViewController: UISearchBarDelegate {
    //MARK: - SearchBarDelegates
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        presentOnlySearchViewController()
    }
}

extension SearchViewController: UITableViewDelegate, UITableViewDataSource {
    //MARK: - TableViewDelegate
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: GlobalConstants.CellStrings.detailSearchedCell,
                                                 for: indexPath) as! ItemTableViewCell
        let item = items[indexPath.row]
        cell.setup(item: item)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = items[indexPath.row]
        self.itemSearchedObject = item
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        self.performSegue(withIdentifier: GlobalConstants.Segues.goToSearchDetail, sender: nil)
    }
}

extension SearchViewController: OnlySearchViewControllerDelegate {
    //MARK: - OnlySearchViewControllerDelegate
    func didSelectedItems(items: String) {
        self.itemsSearchedOnlySearch = items
        if(!(itemsSearchedOnlySearch.isEmpty)) {
            presentSearchViewController()
        }
    }
}

extension SearchViewController: BaseServiceView {
    func startCallingService() {
        
    }
    
    func finishCallService() {
        
    }
    
    func setResponse(objectCodable: Any) {
        if let items = objectCodable as? [ItemSearched] {
            self.items = items
            self.tableView.reloadData()
            setEmpty()
        }
    }
    
    func setEmpty() {
        if(items.count == 0) {
            tableView.isHidden = true
            magnifyingglassImageView.isHidden = false
            noFindLabel.isHidden = false
            searchOtherLabel.isHidden = false
        } else {
            tableView.isHidden = false
            magnifyingglassImageView.isHidden = true
            noFindLabel.isHidden = true
            searchOtherLabel.isHidden = true
        }
    }
    
    func setError(error: String?) {
        setEmpty()
    }
}
