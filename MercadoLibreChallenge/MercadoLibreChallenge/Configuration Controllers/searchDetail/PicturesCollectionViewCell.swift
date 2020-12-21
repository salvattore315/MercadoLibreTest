//
//  PicturesCollectionViewCell.swift
//  MercadoLibreChallenge
//
//  Created by Salvador Martinez on 20/12/20.
//

import UIKit
import SDWebImage

class PicturesCollectionViewCell: UICollectionViewCell {
    //MARKS: Variable & Outlets
    @IBOutlet weak var imageView: UIImageView!
    
    //MARK: - Setup
    public func setup(url: String ) {
        imageView.sd_setImage(with: URL(string: url))
    }
}
