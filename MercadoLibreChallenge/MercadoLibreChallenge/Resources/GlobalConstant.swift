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
        static let development = "https://api.mercadolibre.com"
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
        static let searchItems = baseUrl + "/sites/MCO/search"
        static func itemDetail(id:String) -> String {
            return baseUrl + "/items/" + id
        }
        static func itemDeatilDescription(id: String) -> String {
            return baseUrl + "/items/" + id + "/description"
        }
        
    }
    
    //MARK: Headers
    struct Headers {
    }
    
    //MARK: - API SERVICES
    struct NameServices {
        static let searchItems = "searchItems"
        static let itemDetail = "itemDetail"
        static let itemDetailDescription = "itemDetailDescription"
        static let itemDetailQuestion = "itemDetailQuestion"
    }
    
    //MARK: - Colors
    struct Colors {
        static let yellowMercadoLibre: UIColor = #colorLiteral(red: 0.9921568627, green: 0.862745098, blue: 0.07450980392, alpha: 1)
    }
    
    //MARK: - Segue
    struct Segues {
        static let goToSearch = "goToSearch"
        static let goToSearchDetail = "goToSearchDetail"
    }
    
    //MARK: - TableViewCellStrings
    struct CellStrings {
        static let detailSearchedCell = "detailSearchedCell"
        static let picturesCell = "picturesCell"
    }
    
}
