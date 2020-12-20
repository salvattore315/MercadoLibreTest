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
    
    public var itemSearched: String = ""
    var items: [ItemSearched] = []
    private let presenter = SearchPresenter()
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.attachView(view: self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter.getItemsService(itemSearched: itemSearched)
    }

    //MARK: - Setup
    internal override func setup() {
        super.setup()
        searchBar.backgroundImage = UIImage()
        searchBar.searchTextField.backgroundColor = .white
        searchBar.placeholder = "searchBarMeli".localized
        searchBar.text = itemSearched
    }
    
    //MARK: - Actions
    @IBAction func backPress(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
}


extension SearchViewController: UITableViewDelegate, UITableViewDataSource {

    //MARK: - TableViewDelegate
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: GlobalConstants.CellStrings.detailSearched,
                                                 for: indexPath) as! ItemTableViewCell
        let item = items[indexPath.row]
        cell.setup(item: item)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: GlobalConstants.Segues.goToSearchDetail, sender: nil)
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
        if(self.items.count == 0) {
            self.tableView.isHidden = true
        } else {
            self.tableView.isHidden = false
        }
    }
    
    func setError(error: String?) {
        
    }
}
