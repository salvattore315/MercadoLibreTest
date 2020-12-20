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
    private var items: [ItemSearched] = []
    private var itemSelected: ItemSearched?
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
        searchBar.searchTextField.font = .systemFont(ofSize: 15, weight: .light)
        searchBar.searchTextField.textColor = .systemGray2
        searchBar.text = itemSearched
        
        noFindLabel.text = "notFind".localized
        searchOtherLabel.text = "searchAnother".localized
    }
    
    //MARK: - Actions
    @IBAction func backPress(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    //MARK: - Segues
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination is SearchDetailViewController {
            let vc = segue.destination as? SearchDetailViewController
            vc?.itemSelected = itemSelected
        }
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
        let item = items[indexPath.row]
        self.itemSelected = item
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
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
