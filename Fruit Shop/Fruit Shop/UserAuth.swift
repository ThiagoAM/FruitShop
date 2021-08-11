//
//  UserAuth.swift
//  Fruit Shop
//
//  Created by Thiago Martins on 09/08/21.
//

import Foundation

struct UserAuth {
    
    static var shared = UserAuth()
    
    func logIn(email: String?, password: String?, onSuccess: @escaping () -> Void, onFailure: @escaping () -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            if UserAuth.emailIsValid(email) && UserAuth.passwordIsValid(password) {
                onSuccess()
            } else {
                onFailure()
            }
        }
    }
    
}

// MARK: - Validation

extension UserAuth {
    
    static func emailIsValid(_ email: String?) -> Bool {
        guard let email = email else { return false }
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    
    static func passwordIsValid(_ password: String?) -> Bool {
        guard let password = password else { return false }
        return password.count > 5
    }
    
}
