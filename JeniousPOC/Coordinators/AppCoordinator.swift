//
//  AppCoordinator.swift
//  JeniousPOC
//
//  Created by Morgan Winbush on 11/14/21.
//

import UIKit


// MARK: ViewFactory - Enum
// Standard enum that creates instances of views
public enum ViewFactory {}

// MARK: NavigationActions - Enum
// A list of navigations actions to be handled
// This will need to be refactored because there is a scaling concern

public enum NavigationActions {
    case registrationCompleted
    case loginCompleted
}

// MARK: Navigation - Protocol

public protocol Navigation {
    func navigate(navigationActions: NavigationActions)
}


// MARK: Coordinator - Protocol
// All navigtion is managed by this functionality

public protocol Coordinator {
    var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }

    func start()
}
