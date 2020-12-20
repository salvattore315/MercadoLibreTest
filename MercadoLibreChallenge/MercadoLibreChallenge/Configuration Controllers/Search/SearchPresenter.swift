//
//  SearchPresenter.swift
//  MercadoLibreChallenge
//
//  Created by Salvador Martinez on 20/12/20.
//

import Foundation

class SearchPresenter: Presenter {
    
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
    
    //MARK: - Action

    //MARK: - UserDefault
    
    //MARK: - Service
    public func getItemsService(itemSearched: String) {
        self.searchView?.startCallingService()
        service.callServiceObject(parameters: nil, service: GlobalConstants.NameServices.searchItems, queryLink: itemSearched) { [self] (data, error) in
            if error != nil {
                searchView?.setError(error: "")
            }
            
            let responseParsed = try! jsonResponse<[ItemSearched]>.decode(data: data)
            searchView?.setResponse(objectCodable: responseParsed?.results)
            searchView?.finishCallService()
            
        }
    }
}
