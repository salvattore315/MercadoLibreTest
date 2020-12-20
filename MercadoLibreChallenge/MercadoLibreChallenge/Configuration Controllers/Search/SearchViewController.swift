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
    
    public var itemSearched: String = ""
    var items: [String] = []
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
        //cell.setup(post: post, index: indexPath.row)
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
        
    }
    
    func setEmpty() {
        
    }
    
    func setError(error: String?) {
        
    }
}
