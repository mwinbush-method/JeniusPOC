//
//  ReduxFramework.swift
//  JeniousPOC
//
//  Created by Morgan Winbush on 11/14/21.
//

import SwiftUI
import Combine

/*
MARK: Store Root Component
The store serves as a container for the ViewModel and Reducer
 
*/
class Store<T: ViewModel, U: Reducer> : ObservableObject {
    typealias ViewModelType = T
    typealias ReducerType = U
    typealias ActionType = ReducerType.ActionType
    
    var didChange = PassthroughSubject<Void, Never>()
    @Published private (set) var viewModel : ViewModelType {didSet {didChange.send()}}
    var reducer: ReducerType
    
    /// Base Initializer -  ViewModel and Reducer Type must be of same type.
    ///
    /// - Parameter reducerType: Initialized Reducer
    /// - Parameter viewModelType: Initialized ViewModel
    /// - Parameter coordinatorDelegate: Reference to delegate owner.
    init(reducerType: ReducerType, viewModelType: ViewModelType, coordinatorDelegate: Navigation?) {
        reducer = reducerType
        reducer.coordinatorDelegate = coordinatorDelegate
        viewModel = viewModelType
    }
    
    /// Convenience Initializer -  Used when initial viewModel defined in Reducer should be used.
    ///
    /// - Parameter reducerType: Initialized Reducer
    /// - Parameter coordinatorDelegate: Reference to delegate owner.
    convenience init(reducerType: ReducerType, coordinatorDelegate: Navigation?) {
        self.init(reducerType: reducerType, viewModelType: reducerType.initialViewModel as! ViewModelType, coordinatorDelegate: coordinatorDelegate)
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /// Reduce And Update - recieves an action and calls the reducer to update the ViewModel
    ///
    /// - Parameter action: An event that occurs on the view. Typically a user interaction
    func reduceAndUpdate(_ action: ActionType) {
        viewModel = reducer.reduce(oldViewModel: viewModel as! ReducerType.ViewModelType, action: action) as! ViewModelType
    }
    
}
