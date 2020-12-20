//
//  MoreViewController.swift
//  MercadoLibreChallenge
//
//  Created by Salvador Martinez on 19/12/20.
//

import UIKit

class MoreViewController: BaseViewController {

    //MARK: - Variable & IBOutlet
    @IBOutlet weak var gearShapeImageView: UIImageView!
    @IBOutlet weak var buildingLabel: UILabel!
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        Helper.rotateAnimation(imageView: gearShapeImageView, duration: 4.0)
    }
    
    //MARK: - Setup
    override func setup() {
        super.setup()
        navigationItem.title = "more".localized
        tabBarItem.title = "Hola"
        buildingLabel.text = "inConstruction".localized
    }
}
