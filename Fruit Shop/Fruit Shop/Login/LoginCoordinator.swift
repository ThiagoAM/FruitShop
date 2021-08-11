//
//  LoginCoordinator.swift
//  Fruit Shop
//
//  Created by Thiago Martins on 10/08/21.
//

import UIKit

class LoginCoordinator: Coordinator {
    
    weak var loginDelegate: LoginDelegate?
    
    init(loginDelegate: LoginDelegate?, navigationController: UINavigationController, parent: Coordinator? = nil) {
        self.loginDelegate = loginDelegate
        super.init(navigationController: navigationController, parent: parent)
    }
    
    override func start() {
        let viewModel = LoginViewModel(loginDelegate: loginDelegate)
        let view = LoginView(viewModel: viewModel)
        navigationController.pushViewController(view, animated: true)
    }
    
    // MARK: Alerts
    
    func presentFailedLoginAlert() {
        navigationController.presentOkAlert(title: "Ops!", message: "Email ou senha inválida, por favor, tente novamente.")
    }
        
}
