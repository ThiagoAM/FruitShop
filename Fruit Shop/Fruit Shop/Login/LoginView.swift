//
//  LoginView.swift
//  Fruit Shop
//
//  Created by Thiago Martins on 09/08/21.
//

import UIKit

class LoginView: UIViewController {

    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    private let viewModel: LoginViewModel
    
    // MARK: - Initialization
    
    init(viewModel: LoginViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        viewModel.view = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Life Cyle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupEmailTextField()
        setupPasswordTextField()
        setupLoginButton()
        setupActivityIndicatorVisibility()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        // Removing the login screen from the navigation
        navigationController?.viewControllers.removeAll(where: { view in
            view == self
        })
        super.viewWillDisappear(animated)
    }
    
    // MARK: - Setup
    
    private func setupEmailTextField() {
        emailField.keyboardType = .emailAddress
    }
    
    private func setupPasswordTextField() {
        passwordField.isSecureTextEntry = true
    }
    
    private func setupLoginButton() {
        loginButton.clipsToBounds = true
        loginButton.layer.cornerRadius = 8
    }
    
    private func setupActivityIndicatorVisibility() {
        activityIndicator.isHidden = !viewModel.isLoading
    }
    
    // MARK: - On Tap
    
    @IBAction func onTapLoginButton(_ sender: UIButton) {
        viewModel.onTapLoginButton(email: emailField.text, password: passwordField.text)
    }
    
}

// MARK: - Refreshable

extension LoginView: Refreshable {
    
    func refresh() {
        setupActivityIndicatorVisibility()
    }
        
}
