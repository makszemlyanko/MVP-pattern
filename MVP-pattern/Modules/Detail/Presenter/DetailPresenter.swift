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
    init(view: DetailViewProtocol, network: NetworkServiceProtocol, comment: Comment?)
    func setComment()
}

class DetailPresenter: DetailPresenterProtocol {
    
    weak var view: DetailViewProtocol?
    let network: NetworkServiceProtocol!
    var comment: Comment?
    
    
    required init(view: DetailViewProtocol, network: NetworkServiceProtocol, comment: Comment?) {
        self.view = view
        self.network = network
        self.comment = comment
    }
    
    func setComment() {
        self.view?.getComment(comment: self.comment)
    }
    
    
}



