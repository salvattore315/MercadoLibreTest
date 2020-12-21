//
//  SearchDetailViewController.swift
//  MercadoLibreChallenge
//
//  Created by Salvador Martinez on 20/12/20.
//

import UIKit

class SearchDetailViewController: BaseViewController {

    //MARK: - Variable & IBOutlet
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var imagesNotFoundLabel: UILabel!
    
    public var itemSearched: ItemSearched?
    public var itemSelected: ItemSelected?
    private var pictures: [Pictures] = []
    private let presenter = SearchDetailPresenter()
   
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.attachView(view: self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: false)
        presenter.getItemService(itemId: itemSearched?.id ?? "")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        super.viewWillAppear(animated)
    }
    
    //MARK: - Setup
    internal override func setup() {
        super.setup()
        self.imagesNotFoundLabel.text = "imagesNotFound".localized
    }

}

extension SearchDetailViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pictures.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let picture = pictures[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GlobalConstants.CellStrings.picturesCell,
                                                      for: indexPath) as! PicturesCollectionViewCell
        cell.setup(url: picture.secure_url ?? "")
        return cell
    }
    
    
}


extension SearchDetailViewController: BaseServiceView {
    func startCallingService() {
        
    }
    
    func finishCallService() {
        
    }
    
    func setResponse(objectCodable: Any) {
        if let itemSelected = objectCodable as? ItemSelected {
            self.titleLabel.text = itemSelected.title
            self.priceLabel.text = itemSelected.price?.currencyFormatted
            self.pictures = itemSelected.pictures ?? []
            setEmpty()
        }
        
        if let itemDescription = objectCodable as? ItemDescription {
            self.descriptionLabel.text = itemDescription.plain_text
        }
    }
    
    func setEmpty() {
        if(pictures.isEmpty) {
            self.imagesNotFoundLabel.isHidden = false
        } else {
            self.imagesNotFoundLabel.isHidden = true
        }
    }
    
    
    func setError(error: String?) {
        self.navigationController?.popViewController(animated: true)
    }
}
