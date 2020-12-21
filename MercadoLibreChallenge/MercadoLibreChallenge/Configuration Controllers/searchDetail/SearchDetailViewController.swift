//
//  SearchDetailViewController.swift
//  MercadoLibreChallenge
//
//  Created by Salvador Martinez on 20/12/20.
//

import UIKit
import KVNProgress

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
        self.navigationController?.setNavigationBarHidden(false, animated: false)
        self.navigationItem.title = "meli".localized
        presenter.attachView(view: self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter.getItemService(itemId: itemSearched?.id ?? "")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    //MARK: - Setup
    internal override func setup() {
        super.setup()
        self.imagesNotFoundLabel.text = "imagesNotFound".localized
    }

}

extension SearchDetailViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
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
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
}


extension SearchDetailViewController: BaseServiceView {
    func startCallingService() {
        KVNProgress.show(withStatus: "loading".localized,
                         on: view)
    }
    
    func finishCallService() {
        KVNProgress.showSuccess(withStatus: "done".localized)

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
            self.collectionView.reloadData()
        }
    }
    
    
    func setError(error: String?) {
        KVNProgress.showError(withStatus: "error".localized) {
            self.navigationController?.popViewController(animated: true)
        }
    }
}
