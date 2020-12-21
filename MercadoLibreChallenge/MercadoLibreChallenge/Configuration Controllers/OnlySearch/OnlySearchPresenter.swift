//
//  OnlySearchPresenter.swift
//  MercadoLibreChallenge
//
//  Created by Salvador Martinez on 20/12/20.
//

import Foundation

class OnlySearchPresenter: Presenter {
    
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
}
