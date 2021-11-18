//
//  LoginViewRedux.swift
//  JeniousPOC
//
//  Created by Morgan Winbush on 11/14/21.
//
import SwiftUI

enum LoginActions: Actions {
    case loginPressed
    case registrationPressed
}

struct LoginViewModel : ViewModel {
    enum ViewState {
        case root
        case failedState
        case loading
    }
    let state : ViewState
    
}

struct LoginReducer: Reducer {
    var coordinatorDelegate: Navigation?
    
    weak var preLoginCoordinator: PreLoginCoordinator?
    
    var initialViewModel: LoginViewModel = LoginViewModel(state: .root)
    
    func reduce(oldViewModel: LoginViewModel, action: LoginActions) -> LoginViewModel {
        var viewModel : LoginViewModel
        switch action {
        case .loginPressed:
            viewModel = LoginViewModel(state: oldViewModel.state)
            
            coordinatorDelegate?.navigate(navigationActions: .loginCompleted)
        case .registrationPressed:
            viewModel = LoginViewModel(state: oldViewModel.state)
            coordinatorDelegate?.navigate(navigationActions: .registrationCompleted)
        }
        return viewModel
    }
    
}
