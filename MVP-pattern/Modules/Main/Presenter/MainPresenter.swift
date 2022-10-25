//
//  MainPresenter.swift
//  MVP-pattern
//
//  Created by Maks Kokos on 25.10.2022.
//

import Foundation

protocol MainViewProtocol: AnyObject {
    func succes()
    func failure(error: Error)
}

protocol MainViewPresenterProtocol: AnyObject {
    init(view: MainViewProtocol, network: NetworkServiceProtocol)
    func getComments()
    var comments: [Comment]? { get set }
    
}

class MainPresenter: MainViewPresenterProtocol {

    
    weak var view: MainViewProtocol?
    var comments: [Comment]?
    let network: NetworkServiceProtocol!
    
    required init(view: MainViewProtocol, network: NetworkServiceProtocol) {
        self.view = view
        self.network = network
        getComments()
    }

    func getComments() {
        network?.getComments(completion: { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let comments):
                    self?.comments = comments
                    self?.view?.succes()
                case .failure(let error):
                    self?.view?.failure(error: error)
                }
            }
        })
    }
    
    
}
