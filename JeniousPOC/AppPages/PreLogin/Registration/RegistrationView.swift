//
//  RegistrationView.swift
//  JeniousPOC
//
//  Created by Morgan Winbush on 11/14/21.
//

import SwiftUI

struct RegistrationView: View {
    @ObservedObject var store : Store<RegistrationViewModel, RegistrationReducer>
    
    var body: some View {
        VStack{
            Text("Registration View")
            Button {
                print("greetings!")
            } label: {
                Text("Created New User")
                    .background(Color.blue)
            }

        }
    }
}

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView(store: Store<RegistrationViewModel, RegistrationReducer>(reducerType: RegistrationReducer(), coordinatorDelegate: nil))
    }
}
