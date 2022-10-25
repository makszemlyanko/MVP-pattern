//
//  Builder.swift
//  MVP-pattern
//
//  Created by Maks Kokos on 25.10.2022.
//

import UIKit

protocol BuilderProtocol  {
    func createMainModule(router: RouterProtocol) -> UIViewController
    func createDetailModule(comment: Comment?, router: RouterProtocol) -> UIViewController
}

class ModuleBuilder: BuilderProtocol {
    
    func createMainModule(router: RouterProtocol) -> UIViewController {
        let view = MainViewController()
        let network = NetworkService()
        let presenter = MainPresenter(view: view, network: network, router: router)
        view.presenter = presenter
        return view
    }
    
    func createDetailModule(comment: Comment?, router: RouterProtocol) -> UIViewController {
        let view = DetailViewController()
        let network = NetworkService()
        let presenter = DetailPresenter(view: view, network: network, router: router, comment: comment)
        view.presenter = presenter
        return view
    }
    
    
}
