//
//  UpdateEmailView.swift
//  MomentaryCo
//
//  Created by David Higgins on 28/9/2023.
//

import SwiftUI

struct UpdateEmailView: View {
    
    @State private var email = ""
    @State private var password = ""
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        VStack(spacing: 24) {
            InputView(text: $email, title: "New Email Address", placeholder: "Please enter your new email")
            InputView(text: $password, title: "Password", placeholder: "Please enter your password to confirm")
            
            // sign in button
            
            Button {
                Task {
                    viewModel.updateEmail(to: email)
                }
            } label: {
                HStack {
                    Text("UPDATE EMAIL")
                        .fontWeight(.semibold)
                    Image(systemName: "arrow.right")
                }
                .foregroundColor(.white)
                    .frame(width: UIScreen.main.bounds.width - 32, height: 48)
            }
            .background(Color(.systemBlue))
            .disabled(!formIsValid)
            .opacity(formIsValid ? 1.0 : 0.5)
            .cornerRadius(10)
            .padding(.top, 24)
        }
        .padding(.horizontal)
        .padding(.top, 30)
        

    }
}

// MARK: - AuthenticationFormProtocol

extension UpdateEmailView: AuthenticationFormProtocol {
    var formIsValid: Bool {
        return !email.isEmpty
        && email.contains("@")
        && !password.isEmpty
        && password.count > 5
    }
}


struct UpdateEmailView_Previews: PreviewProvider {
    static var previews: some View {
        UpdateEmailView()
    }
}
