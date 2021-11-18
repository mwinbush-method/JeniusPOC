//
//  Reducer.swift
//  JeniousPOC
//
//  Created by Morgan Winbush on 11/14/21.
//

import Foundation

/*
MARK: Store Root Component
Reducer serves to update ViewModel
 
*/
public protocol Reducer {
    associatedtype ViewModelType : ViewModel
    associatedtype ActionType : Actions
    
    var initialViewModel : ViewModelType { get }
    var coordinatorDelegate: Navigation? { get set }
    
    /// Reduce and update
    /// - Parameter oldViewModel: Current ViewModel Object.
    /// - Parameter action: Action reported from teh View.
    /// - Returns: Updated ViewModel
    func reduce(oldViewModel: ViewModelType, action: ActionType) -> ViewModelType
    
}
