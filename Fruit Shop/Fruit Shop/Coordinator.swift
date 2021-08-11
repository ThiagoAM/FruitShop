//
//  Coordinator.swift
//  Fruit Shop
//
//  Created by Thiago Martins on 10/08/21.
//

import UIKit

class Coordinator {
    
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    
    weak var parentCoordinator: Coordinator?
    
    init(navigationController: UINavigationController, parent: Coordinator? = nil) {
        self.navigationController = navigationController
        self.parentCoordinator = parent
    }
    
    func start() {}
    
    func startChildCoordinator(_ child: Coordinator) {
        child.parentCoordinator = self
        childCoordinators.append(child)
        child.start()
    }
    
}
