//
//  MainCoordinator.swift
//  Fruit Shop
//
//  Created by Thiago Martins on 10/08/21.
//

import Foundation

class MainCoordinator: Coordinator {
    
    static var shared: MainCoordinator!
    
    override func start() {
        goToLogin()
    }
    
    func goToLogin() {
        let loginCoordinator = LoginCoordinator(loginDelegate: self, navigationController: navigationController)
        startChildCoordinator(loginCoordinator)
    }
    
    func goToProductSelection() {
        let productSelectionCoordinator = ProductSelectionCoordinator(navigationController: navigationController)
        startChildCoordinator(productSelectionCoordinator)
    }
    
}

// MARK: - Login Delegate

extension MainCoordinator: LoginDelegate {
    
    func didLoginSuccessfully() {
        goToProductSelection()
    }
    
    func didFailToLogin() {
        if let loginCoordinator = childCoordinators.first(where: { $0 as? LoginCoordinator != nil }) {
            (loginCoordinator as? LoginCoordinator)?.presentFailedLoginAlert()
        }
    }
    
}
