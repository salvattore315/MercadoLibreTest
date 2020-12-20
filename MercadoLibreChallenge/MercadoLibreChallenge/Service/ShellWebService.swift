//
//  ShellWebService.swift
//  MercadoLibreChallenge
//
//  Created by Salvador Martinez on 19/12/20.
//

import Foundation
import Alamofire

protocol Service{
    func callServiceObject(parameters:[String: AnyObject]?,
                           service:String,
                           withCompletionBlock: @escaping  ((Data?, _ error: NSError?) -> Void))
}

class ShellWebService : Service {

    public func selectWebService(service:String,
                                 params:[String:AnyObject]?, returnService: ((_ method: HTTPMethod,
                                                                                              _ serviceUrl: String?,
                                                                                              _ typeEncoding: ParameterEncoding) -> Void)){
        
        switch service {
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
                                  withCompletionBlock: @escaping ((Data?, _ error: NSError?) -> Void)){
        
        selectWebService(service: service, params:parameters,  returnService: { (method, url, typeEncoding) -> Void in
            
            let headers = settingHeader()
            let parametersEdited = self.editParameters(parameters: parameters)
            
            print("----------API SERVICE PARAMETERS-------------")
            print(url ?? "nil")
            if url?.lowercased().range(of:"login") == nil{
                print("\(parametersEdited ?? ["parameterEdited": "nil" as AnyObject])")
            }
            print("\(headers ?? ["header" : "nil"])")
            print("----------END API SERVICE PARAMETERS----------")
            
            AF.request(url!, method: method,
                       parameters: parametersEdited,
                       encoding: typeEncoding,
                       headers: headers).responseJSON { (response) in
                        
                if(response.data != nil) {
                    withCompletionBlock(response.data, nil)
                } else {
                    let error = NSError(domain: "",
                                        code: 00,
                                        userInfo: ["message": "something bad"])
                    withCompletionBlock(nil, error)
                }
            }
        })//SelectWebService
    }//Function
}