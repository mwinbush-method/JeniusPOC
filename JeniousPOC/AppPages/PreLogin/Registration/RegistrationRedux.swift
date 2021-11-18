//
//  RegistrationRedux.swift
//  JeniousPOC
//
//  Created by Morgan Winbush on 11/14/21.
//

import Foundation

enum RegistrationActions: Actions {
    case valueIncreased
    case valueDecreased
}

struct RegistrationViewModel : ViewModel {
    enum State {
        case root
        case failedState
        case loading
    }
    let state : State
}

struct RegistrationReducer: Reducer {
    var coordinatorDelegate: Navigation?
    
    var initialViewModel: RegistrationViewModel = RegistrationViewModel(state: .root)
    
    func reduce(oldViewModel: RegistrationViewModel, action: RegistrationActions) -> RegistrationViewModel {
        var viewModel : RegistrationViewModel
        switch action {
        case .valueIncreased:
            viewModel = RegistrationViewModel(state: oldViewModel.state)
        case .valueDecreased:
            viewModel = RegistrationViewModel(state: oldViewModel.state)
        }
        return viewModel
    }
}
