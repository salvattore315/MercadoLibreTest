//
//  NotificationsViewController.swift
//  MercadoLibreChallenge
//
//  Created by Salvador Martinez on 19/12/20.
//

import UIKit

class NotificationsViewController: BaseViewController {

    //MARK: - Variable & IBOutlet
    @IBOutlet weak var gearShapeImageView: UIImageView!
    @IBOutlet weak var buildingLabel: UILabel!
    @IBOutlet weak var loginButton: UIButton!
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    //MARK: - Setup
    override func setup() {
        super.setup()
        navigationItem.title = "notifications".localized
        buildingLabel.text = "seeNotifications".localized
        loginButton.setTitle("loginAccount".localized, for: .normal)
        loginButton.layer.cornerRadius = 5
    }
}
