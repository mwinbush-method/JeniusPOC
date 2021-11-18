//
//  MainCoordinator.swift
//  JeniousPOC
//
//  Created by Morgan Winbush on 11/14/21.
//

import Foundation
import UIKit


// MARK: - The Root Coordinator
class MainCoordinator: Coordinator {
    var childCoordinators = [Coordinator]()
    
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        loadPreLoginCoordinator()
    }
    
    func loadPreLoginCoordinator(){
        let preLoginCoordinator = PreLoginCoordinator(navigationController: self.navigationController)
        childCoordinators.removeAll()
        childCoordinators.append(preLoginCoordinator)
        preLoginCoordinator.start()
    }
    
    func loadPostLoginCoordinator(){
        let postLoginCoordinator = PostLoginCoordinator(navigationController: self.navigationController)
        childCoordinators.removeAll()
        childCoordinators.append(postLoginCoordinator)
        postLoginCoordinator.start()
    }
    
}
