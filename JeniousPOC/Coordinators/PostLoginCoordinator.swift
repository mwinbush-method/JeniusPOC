//
//  PostLoginCoordinator.swift
//  JeniousPOC
//
//  Created by Morgan Winbush on 11/14/21.
//

import UIKit
import SwiftUI

class PostLoginCoordinator: Coordinator {
    var childCoordinators: [Coordinator]
    
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        childCoordinators = [Coordinator]()
    }
    
    func start() {
        // TODO: Create Initial Route for PostLogin Navigation
    }
    
}
