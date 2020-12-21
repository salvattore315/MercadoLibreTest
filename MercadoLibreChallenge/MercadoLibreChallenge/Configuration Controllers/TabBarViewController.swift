//
//  TabBarViewController.swift
//  MercadoLibreChallenge
//
//  Created by Salvador Martinez on 19/12/20.
//

import UIKit

class TabBarViewController: UITabBarController {
    @IBOutlet weak var tabbar: UITabBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let items = tabbar.items
        items?[0].title = "start".localized
        items?[1].title = "favorites".localized
        items?[2].title = "myShopping".localized
        items?[3].title = "notifications".localized
        items?[4].title = "more".localized
    }
}
