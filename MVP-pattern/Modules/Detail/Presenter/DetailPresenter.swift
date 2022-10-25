//
//  DetailPresenter.swift
//  MVP-pattern
//
//  Created by Maks Kokos on 25.10.2022.
//

import Foundation

protocol DetailViewProtocol: AnyObject {
    func getComment(comment: Comment?)
}

protocol DetailPresenterProtocol: AnyObject {
    init(view: DetailViewProtocol, network: NetworkServiceProtocol, router: RouterProtocol, comment: Comment?)
    func setComment()
    func tap()
}

class DetailPresenter: DetailPresenterProtocol {
    
    weak var view: DetailViewProtocol?
    let network: NetworkServiceProtocol!
    var router: RouterProtocol?
    var comment: Comment?
    
    
    required init(view: DetailViewProtocol, network: NetworkServiceProtocol, router: RouterProtocol , comment: Comment?) {
        self.view = view
        self.network = network
        self.router = router
        self.comment = comment
    }
    
    func tap() {
        router?.popToRoot()
    }
    
    func setComment() {
        self.view?.getComment(comment: self.comment)
    }
    
    
}



