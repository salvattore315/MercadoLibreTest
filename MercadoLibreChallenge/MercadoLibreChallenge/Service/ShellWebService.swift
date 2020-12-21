//
//  ShellWebService.swift
//  MercadoLibreChallenge
//
//  Created by Salvador Martinez on 19/12/20.
//

import Foundation
import Alamofire

protocol Service{
    func callServiceObject(parameters: [String : AnyObject]?,
                           service:String,
                           queryLink: String?,
                           withCompletionBlock: @escaping  ((Data?, _ error: NSError?) -> Void))
}

class ShellWebService : Service {

    public func selectWebService(service:String,
                                 params:[String:AnyObject]?,
                                 queryLink: String?,
                                 returnService: ((_ method: HTTPMethod,
                                                  _ serviceUrl: String?,
                                                  _ typeEncoding: ParameterEncoding) -> Void)){
        
        switch service {
        case GlobalConstants.NameServices.searchItems:
            returnService(.get, GlobalConstants.Endpoints.searchItems, URLEncoding())
        case GlobalConstants.NameServices.itemDetail:
            var id = ""
            if let idSearched = queryLink {
                id = idSearched
            }
            returnService(.get, GlobalConstants.Endpoints.itemDetail(id: id), URLEncoding())
        case GlobalConstants.NameServices.itemDetailDescription:
            var id = ""
            if let idSearched = queryLink {
                id = idSearched
            }
            returnService(.get, GlobalConstants.Endpoints.itemDeatilDescription(id: id), JSONEncoding())
        default:
            break
        }
    }
    
    private func editParameters(parameters: [String : AnyObject]?)->[String : AnyObject]?{
         
         var parametersEdited:[String : AnyObject] = [:]
         if parameters != nil{
             parametersEdited = parameters!
         }
         
         return parametersEdited
     }
     
     private func settingHeader()-> HTTPHeaders?{
         
         let header: HTTPHeaders = []
         return header
     }
    
    public func callServiceObject(parameters:[String: AnyObject]?,
                                  service:String,
                                  queryLink: String?,
                                  withCompletionBlock: @escaping ((Data?, _ error: NSError?) -> Void)){
        
        selectWebService(service: service, params:parameters, queryLink: queryLink,  returnService: { (method, url, typeEncoding) -> Void in
            
            let headers = settingHeader()
            let parametersEdited = self.editParameters(parameters: parameters)
            
            print("----------API SERVICE PARAMETERS-------------")
            print(url ?? "nil")
            print("\(headers ?? ["header" : "nil"])")
            print("----------END API SERVICE PARAMETERS----------")
            
            AF.request(url!, method: method,
                       parameters: parametersEdited,
                       encoding: typeEncoding,
                       headers: headers).responseJSON { (response) in
                        
                        switch response.result{
                        case .success:
                            let code = response.response!.statusCode
                            
                            if code <= 299{
                                withCompletionBlock(response.data,nil)
                            }else{
                                let error:NSError = NSError(domain: "", code: code, userInfo: ["message":"", "title" : ""])
                                withCompletionBlock(nil,error)
                            }
                            break
                            
                        case .failure(let error):
                            var messageResponse = "serverError".localized
                            let code : Int?
                            if response.response?.statusCode != nil{
                                code = response.response!.statusCode
                            }else{
                                if let err = error as? URLError, err.code  == URLError.Code.notConnectedToInternet{
                                    messageResponse = "noInternetConection".localized
                                }
                                code = 500
                            }
                            
                            print("error")
                            
                            let error:NSError = NSError(domain: "", code: code!, userInfo: ["message": messageResponse])
                            
                            withCompletionBlock(nil,error)
                            break
                        }//Switch
                       }
        })//SelectWebService
    }//Function
}
