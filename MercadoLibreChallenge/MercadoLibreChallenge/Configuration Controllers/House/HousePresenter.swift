//
//  HousePresenter.swift
//  MercadoLibreChallenge
//
//  Created by Salvador Martinez on 20/12/20.
//

import Foundation

class HousePresenter: Presenter {
    
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
    public func getPostsService() {
        self.searchView?.startCallingService()
        service.callServiceObject(parameters: nil, service: "", queryLink: nil) { [self] (data, error) in
            if error != nil {
                self.searchView?.setError(error: "")
            }
            
            if data != nil {
//                if let posts: [Post] = JSONDecoder().decodeResponse(from: data){
//                    print(posts)
//                    saveAllPostInRealm(posts: posts)
//                    getAllPostInRealm()
//                    self.postView?.finishCallService()
//                } else {
//                    self.postView?.setError(error: "")
//                }
            }
        }
    }
}
