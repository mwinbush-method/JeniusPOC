//
//  JeniusButton.swift
//  JeniousPOC
//
//  Created by Morgan Winbush on 11/15/21.
//

import SwiftUI

enum ButtonType {
    case primary
    case secondary
    case confirm
    case cancel
}

struct JeniusButton: View {
    let title: String
    let buttonType: ButtonType
    let callback: (()->Void)
    var body: some View {
        Button {
           callback()
        } label: {
            Text(title)
                .frame(height: 50)
                .frame(minWidth: 80, maxWidth: .infinity)
                .font(.system(size: 16, weight: .bold))
                .foregroundColor(getForegroundColor())
                .background(getBackgroundColor())
                .cornerRadius(8)
        }
    }
    
    func getBackgroundColor() -> Color {
        switch buttonType {
        case .primary:
            return Color.blue
        case .secondary:
            return Color.mint
        case .confirm:
            return Color.green
        case .cancel:
            return Color.red
        }
    }
    
    func getForegroundColor() -> Color {
        switch buttonType {
        case .secondary:
            return Color.black
        default:
            return Color.white
        }
    }
}

struct JeniusButton_Previews: PreviewProvider {
    static var previews: some View {
        JeniusButton(title: "First Button", buttonType: .confirm){
            print("Button Pressed")
        }
    }
}
