//
//  PreLoginCoordinator.swift
//  JeniousPOC
//
//  Created by Morgan Winbush on 11/14/21.
//

import UIKit
import SwiftUI

/*
MARK: - PreLogin Coordinator
This Coordinator will manage PreLogin route management.

*/
class PreLoginCoordinator: Coordinator, Navigation {

    weak var parentCoordinator: MainCoordinator?
    var childCoordinators: [Coordinator]
    
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        childCoordinators = [Coordinator]()
    }
    
    // A Default Start function that initializes the first View in the Scene
    func start() {
        login()
    }
    
    
    func login() {
        let vc = ViewFactory.PreLogin.login(viewModel: nil, navigator: self).viewController
        navigationController.pushViewController(vc, animated: false)
        parentCoordinator?.loadPostLoginCoordinator()
    }

    func registration() {
        let vc = ViewFactory.PreLogin.registration(viewModel: nil, navigator: self).viewController
        navigationController.pushViewController(vc, animated: false)
    }
    
    func navigate(navigationActions: NavigationActions) {
        switch navigationActions {
        case .loginCompleted:
            login()
        case .registrationCompleted:
            registration()
        default:
            // This should not be called, but just as a percaution.
            print("Resolve by another Coordinator")
        }
    }
}
