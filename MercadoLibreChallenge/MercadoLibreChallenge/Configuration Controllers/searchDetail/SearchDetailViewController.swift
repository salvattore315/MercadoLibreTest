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
    @IBOutlet weak var pagerLabel: UILabel!
    
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
        pagerLabel.layer.cornerRadius = 10
        pagerLabel.layer.masksToBounds = true
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
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
       let visibleRect = CGRect(origin: self.collectionView.contentOffset, size: self.collectionView.bounds.size)
       let visiblePoint = CGPoint(x: visibleRect.midX, y: visibleRect.midY)
       if let visibleIndexPath = self.collectionView.indexPathForItem(at: visiblePoint) {
        self.pagerLabel.text = "\(visibleIndexPath.row+1)/\(pictures.count)"
       }
    }
}


extension SearchDetailViewController: BaseServiceView {
    func startCallingService() {
        KVNProgress.show(withStatus: "loading".localized,
                         on: view)
    }
    
    func finishCallService() {
        KVNProgress.dismiss()
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
            self.pagerLabel.isHidden = true
        } else {
            self.imagesNotFoundLabel.isHidden = true
            self.collectionView.reloadData()
            self.pagerLabel.isHidden = false
            self.pagerLabel.text = "1/\(pictures.count)"
        }
    }
    
    
    func setError(error: String?) {
        KVNProgress.showError(withStatus: "error".localized) {
            self.navigationController?.popViewController(animated: true)
        }
    }
}
