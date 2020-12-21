//
//  SearchDetailPresenter.swift
//  MercadoLibreChallenge
//
//  Created by Salvador Martinez on 20/12/20.
//

import Foundation

class SearchDetailPresenter: Presenter {
    
    weak private var searchView : BaseServiceView?
    
    //MARK: - Init Presenter
    override init() {
        super.init()
    }
    
    public func attachView(view: BaseServiceView) {
        searchView = view
    }
    
    public func detachView() {
        searchView = nil
    }
    
    //MARK: - Service
    public func getItemService(itemId: String) {
        self.searchView?.startCallingService()
        service.callServiceObject(parameters: nil,
                                  service: GlobalConstants.NameServices.itemDetail,
                                  queryLink: itemId) { [self] (data, error) in
            if error != nil {
                self.searchView?.setError(error: "")
            }
            
            let responseParsed = try? ItemSelected.decode(data: data)
            if(responseParsed != nil) {
                searchView?.setResponse(objectCodable: (responseParsed ?? nil)!)
                getItemDescriptionService(itemId: itemId)
            } else {
                searchView?.setError(error: "")
            }
        }
    }
    
    public func getItemDescriptionService(itemId: String) {
        service.callServiceObject(parameters: nil,
                                  service: GlobalConstants.NameServices.itemDetailDescription,
                                  queryLink: itemId) { [self] (data, error) in
            if error != nil {
                self.searchView?.setError(error: "")
            }
            
            let responseParsed = try? ItemDescription.decode(data: data)
            if(responseParsed != nil) {
                searchView?.setResponse(objectCodable: (responseParsed ?? nil)!)
                searchView?.finishCallService()
            } else {
                searchView?.setError(error: "")
            }
        }
    }
}
