//
//  ViewFactory+Extension+PostLogin.swift
//  JeniousPOC
//
//  Created by Morgan Winbush on 11/15/21.
//

import UIKit
import SwiftUI

extension ViewFactory {
    enum PreLogin {
        case login(viewModel: LoginViewModel?, navigator: Navigation)
        case registration(viewModel: RegistrationViewModel?, navigator: Navigation)
        
        var viewController: UIViewController {
            switch(self) {
            case .login(let viewModel, let navigator):
                let store: Store<LoginViewModel, LoginReducer>
                if let vm = viewModel {
                    store = Store<LoginViewModel, LoginReducer>(reducerType: LoginReducer(), viewModelType: vm, coordinatorDelegate: navigator)
                } else {
                    store = Store<LoginViewModel, LoginReducer>(reducerType: LoginReducer(), coordinatorDelegate: navigator)
                }
                return UIHostingController(rootView: LoginView(store: store))
            case .registration(let viewModel, let navigator):
                let store: Store<RegistrationViewModel, RegistrationReducer>
                if let vm = viewModel {
                    store = Store<RegistrationViewModel, RegistrationReducer>(reducerType: RegistrationReducer(), viewModelType: vm, coordinatorDelegate: navigator)
                } else {
                    store = Store<RegistrationViewModel, RegistrationReducer>(reducerType: RegistrationReducer(), coordinatorDelegate: navigator)
                }
                return UIHostingController(rootView: RegistrationView(store: store))
            }
        }
    }
}
