//
//  LoginDelegate.swift
//  Fruit Shop
//
//  Created by Thiago Martins on 10/08/21.
//

import Foundation

protocol LoginDelegate: AnyObject {
    func didLoginSuccessfully()
    func didFailToLogin()
}
