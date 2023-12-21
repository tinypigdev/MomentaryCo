//
//  ReauthenticateView.swift
//  MomentaryCo
//
//  Created by David Higgins on 7/10/2023.
//

import SwiftUI
import Firebase

struct ReauthenticateView: View {
    @Binding var isAuthenticated: Bool
    @Binding var showReauthenticationView: Bool
    @State private var email = ""
    @State private var password = ""
    @State private var errorText = ""
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var authViewModel: AuthViewModel
    
    
    var body: some View {
      
            VStack {
                TextField("Enter your email address", text: $email)
                SecureField("Enter your password", text: $password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                HStack {
                    Button("Authenticate") {
                        showReauthenticationView = authViewModel.reauthenticateWithPassword(email: email, password: password)
                        
                        print("The value of showReauthenticationView is: \(showReauthenticationView)")
                        
                    }
                }
                .padding(.vertical, 15)
                .frame(width: 170)
                .background(Color.blue)
                .cornerRadius(8)
                .foregroundColor(.white)
                .opacity(password.isEmpty ? 0.6 : 1)
                .disabled(password.isEmpty)
                
                Button("Cancel") {
                    dismiss()
                }
                .padding(.vertical, 15)
                .frame(width: 170)
                .background(Color.red)
                .cornerRadius(8)
                .foregroundColor(.white)
                
                
            }.padding()
    }
    
    func handleResult(result: Result<Bool,Error>) {
        switch result {
        case .success:
            // Reauthenticated now so you can delete
            isAuthenticated = true
            print("User is successfully reauthenticated...")
        case .failure(let error):
            errorText = error.localizedDescription
            print("User reauthentication failed with error: \(error.localizedDescription)")
        }
    }
        
}

struct ReauthenticateView_Previews: PreviewProvider {
    static var previews: some View {
        ReauthenticateView(isAuthenticated: .constant(false), showReauthenticationView: .constant(false))
    }
}
