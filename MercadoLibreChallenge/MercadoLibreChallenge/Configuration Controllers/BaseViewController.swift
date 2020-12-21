//
//  BaseViewController.swift
//  MercadoLibreChallenge
//
//  Created by Salvador Martinez on 19/12/20.
//
import UIKit

class BaseViewController: UIViewController {

    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        Helper.initScreenProgress()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setup()
    }
    
    //MARK: - Setup
    internal func setup() {
        
    }
}
