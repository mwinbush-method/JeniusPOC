//
//  ViewFactory+PostLogin.swift
//  JeniousPOC
//
//  Created by Morgan Winbush on 11/14/21.
//

import UIKit
import SwiftUI

extension ViewFactory {
    enum PostLogin {
        case tab(viewModel: LoginViewModel?, navigator: Navigation)
        
        var viewController: UIViewController {
            switch(self) {
            case .tab(let viewModel, let navigator):
                let store: Store<LoginViewModel, LoginReducer>
                if let vm = viewModel {
                    store = Store<LoginViewModel, LoginReducer>(reducerType: LoginReducer(), viewModelType: vm, coordinatorDelegate: navigator)
                } else {
                    store = Store<LoginViewModel, LoginReducer>(reducerType: LoginReducer(), coordinatorDelegate: navigator)
                }
                return UIHostingController(rootView: LoginView(store: store))
            }
        }
    }
}
