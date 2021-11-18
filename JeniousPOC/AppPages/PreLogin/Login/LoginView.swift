//
//  LoginView.swift
//  JeniousPOC
//
//  Created by Morgan Winbush on 11/14/21.
//

import SwiftUI

struct LoginView: View {
    @ObservedObject var store : Store<LoginViewModel, LoginReducer>
    
    var body: some View {
        VStack {
            Text("Login View")

            JeniusButton(title: "Login", buttonType: .primary) {
                store.reduceAndUpdate(.loginPressed)
            }.padding(.horizontal)
            
            JeniusButton(title: "Registration", buttonType: .cancel) {
                store.reduceAndUpdate(.loginPressed)
            }.padding(.horizontal)
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(
            store: Store<LoginViewModel, LoginReducer>(reducerType: LoginReducer(), coordinatorDelegate: nil)
        )
    }
}
