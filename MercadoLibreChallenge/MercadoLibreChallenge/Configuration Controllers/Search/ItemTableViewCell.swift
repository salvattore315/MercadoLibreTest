//
//  ItemTableViewCell.swift
//  MercadoLibreChallenge
//
//  Created by Salvador Martinez on 20/12/20.
//

import UIKit
import SDWebImage

class ItemTableViewCell: UITableViewCell {

    //MARKS: Variable & Outlets
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var sendFreeLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    
    //MARKS: Lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    //MARK: - Setup
    public func setup(item: ItemSearched) {
        titleLabel.text = item.title
        priceLabel.text = item.price?.currencyFormatted
        iconImageView.sd_setImage(with: URL(string: (item.thumbnail ?? "")))
        sendFreeLabel.text = "freeShipping".localized
        sendFreeLabel.isHidden = !(item.shipping?.free_shipping ?? false)
    }

}
