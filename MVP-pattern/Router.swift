//
//  Router.swift
//  MVP-pattern
//
//  Created by Maks Kokos on 25.10.2022.
//

import UIKit

protocol RouterMain {
    var navController: UINavigationController? { get set }
    var builder: BuilderProtocol? { get set }
}

protocol RouterProtocol: RouterMain {
    func initialViewController()
    func showDetail(comment: Comment?)
    func popToRoot()
}

class Router: RouterProtocol {
    
    var navController: UINavigationController?
    var builder: BuilderProtocol?
    
    init(navController: UINavigationController, builder: BuilderProtocol) {
        self.navController = navController
        self.builder = builder
    }
    
    func initialViewController() {
        if let navController = navController {
            guard let mainVC = builder?.createMainModule(router: self) else { return }
            navController.viewControllers = [mainVC]
            
        }
    }
    
    func showDetail(comment: Comment?) {
        if let navController = navController {
            guard let detailVC = builder?.createDetailModule(comment: comment, router: self) else { return }
            navController.pushViewController(detailVC, animated: true)
        }
    }
    
    func popToRoot() {
        if let navController = navController {
            navController.popToRootViewController(animated: true)
        }
    }
    
    
}
