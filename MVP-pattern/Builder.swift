//
//  Builder.swift
//  MVP-pattern
//
//  Created by Maks Kokos on 25.10.2022.
//

import UIKit

protocol Builder  {
    static func createMainModule() -> UIViewController
    static func createDetailModule(comment: Comment?) -> UIViewController
}

class ModuleBuilder: Builder {
    
    static func createMainModule() -> UIViewController {
        let view = MainViewController()
        let network = NetworkService()
        let presenter = MainPresenter(view: view, network: network)
        view.presenter = presenter
        return view
    }
    
    static func createDetailModule(comment: Comment?) -> UIViewController {
        let view = DetailViewController()
        let network = NetworkService()
        let presenter = DetailPresenter(view: view, network: network, comment: comment)
        view.presenter = presenter
        return view
    }
    
    
}
