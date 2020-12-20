//
//  GlobalConstant.swift
//  MercadoLibreChallenge
//
//  Created by Salvador Martinez on 19/12/20.
//
import Foundation
import UIKit
var apiUrl = ""

//MARK: Loading Configuration Details
enum Environment: String {
    case development = "development"
    case production = "production"
    
    private struct Domains {
        static let development = ""
        static let production = ""
    }
    
    private struct Routes {
        static let api = ""
    }
    
    var baseUrl: String {
        switch self {
        case .development:
            return setUrl(domain: Domains.development,
                          route: Routes.api)
        case .production:
            return setUrl(domain: Domains.production,
                          route: Routes.api)
        }
    }
}

func setUrl(domain:String, route:String) -> String {
    apiUrl = domain + route
    return apiUrl
}

struct Configuration {
    var environment: Environment = {
        if let configuration = Bundle.main.object(forInfoDictionaryKey: "Configuration") as? String {
            return Environment.production
        }
        return Environment.development
    }()
}

struct GlobalConstants {
    
    //MARK: Configuring the environment
    private static let baseUrl = apiUrl
    
    //MARK: - Keys
    struct Keys{
    }
    
    //MARK: ENDPOINTS
    struct Endpoints {
    }
    
    //MARK: Headers
    struct Headers {
    }
    
    //MARK: - API SERVICES
    struct nameServices {
    }
    
}
