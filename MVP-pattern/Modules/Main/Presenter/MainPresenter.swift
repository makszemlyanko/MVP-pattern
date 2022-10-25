//
//  MainPresenter.swift
//  MVP-pattern
//
//  Created by Maks Kokos on 25.10.2022.
//

import Foundation

protocol MainViewProtocol: AnyObject {
    func success()
    func failure(error: Error)
}

protocol MainViewPresenterProtocol: AnyObject {
    init(view: MainViewProtocol, network: NetworkServiceProtocol, router: RouterProtocol)
    func getComments()
    var comments: [Comment]? { get set }
    func tapOnTheComment(comment: Comment?)
}

class MainPresenter: MainViewPresenterProtocol {
    
    weak var view: MainViewProtocol?
    var comments: [Comment]?
    var router: RouterProtocol?
    let network: NetworkServiceProtocol!
    
    required init(view: MainViewProtocol, network: NetworkServiceProtocol, router: RouterProtocol) {
        self.view = view
        self.network = network
        self.router = router
        getComments()
    }
    
    func tapOnTheComment(comment: Comment?) {
        router?.showDetail(comment: comment)
    }

    func getComments() {
        network?.getComments(completion: { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let comments):
                    self?.comments = comments
                    self?.view?.success()
                case .failure(let error):
                    self?.view?.failure(error: error)
                }
            }
        })
    }
    
    
}
