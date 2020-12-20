//
//  Presenter.swift
//  MercadoLibreChallenge
//
//  Created by Salvador Martinez on 19/12/20.
//

import Foundation

protocol BaseServiceView: NSObjectProtocol {
    func startCallingService()
    func finishCallService()
    func setResponse(objectCodable: Any)
    func setEmpty()
    func setError(error: String?)
}

class Presenter {
    public let service: ShellWebService = ShellWebService()
    public let configuration = Configuration()
    var baseUrl = "", environment = ""
        
    init() {
        environment = configuration.environment.rawValue
        baseUrl = configuration.environment.baseUrl
    }
    
}

