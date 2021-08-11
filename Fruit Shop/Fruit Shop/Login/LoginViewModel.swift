//
//  LoginViewModel.swift
//  Fruit Shop
//
//  Created by Thiago Martins on 10/08/21.
//

import UIKit

class LoginViewModel {
        
    weak var loginDelegate: LoginDelegate?
    weak var view: Refreshable?
    
    // MARK: - Initialization
    
    init(loginDelegate: LoginDelegate?) {
        self.loginDelegate = loginDelegate
    }
    
    // MARK: - On Tap
    
    func onTapLoginButton(email: String?, password: String?) {
        isLoading = true
        view?.refresh()
        UserAuth.shared.logIn(email: email, password: password, onSuccess: {
            // User logged in successfully
            self.isLoading = false
            self.view?.refresh()
            self.loginDelegate?.didLoginSuccessfully()
        }, onFailure: {
            // Failed to log in
            self.isLoading = false
            self.view?.refresh()
            self.loginDelegate?.didFailToLogin()
        })
    }
    
    // MARK: Getters
    
    private(set) var isLoading: Bool = false
    
}
