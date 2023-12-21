//
//  DeleteAccountView.swift
//  MomentaryCo
//
//  Created by David Higgins on 5/10/2023.
//

import SwiftUI

struct DeleteAccountView: View {
    @EnvironmentObject var authViewModel: AuthViewModel
    @Environment(\.presentationMode) var presentationMode
    @State private var isAuthenticated = false
    @State private var showReauthenticationView = false
    @State private var deleteWarning = "Deleting your account will delete all content and remove your information from the database. \n \n To proceed you must first re-authenticate"
    
    
    var body: some View {
        
        VStack {
            Text("You are logged in as \(authViewModel.user?.email ?? "Debug error: User not found.")")
            isAuthenticated ? Text("You can now delete your account")
                .fontWeight(.bold)
                .padding()
                .multilineTextAlignment(.center) :
            Text(deleteWarning)
            .fontWeight(.bold)
            .padding()
            .multilineTextAlignment(.center)
            
            HStack {
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                },
                       label: {
                    Text("CANCEL")
                })
                .padding(.vertical, 15)
                .frame(width: 179)
                .background(Color(.systemBackground))
                .cornerRadius(8)
                .foregroundColor(Color(.label))
                .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.gray, lineWidth: 1))
                
                //            Spacer()
                
                Button(action: {
                    if isAuthenticated {
                        authViewModel.deleteAccount()
                        authViewModel.signOut()
                        
                    }
                    else {
                        showReauthenticationView.toggle()
                    }
                    
                }, label: {
                    
                    Text(isAuthenticated ? "DELETE" : "AUTHENTICATE")
                })
                .padding(.vertical, 15)
                .frame(width: 179)
                .background(Color.red)
                .cornerRadius(8)
                .foregroundColor(.white)
            }
            
            
        }.sheet(isPresented: $showReauthenticationView, onDismiss: didDismiss) {
            ReauthenticateView(isAuthenticated: $isAuthenticated, showReauthenticationView: $showReauthenticationView)
        }
    }
    func didDismiss() {
        showReauthenticationView = false
    }
}

struct DeleteAccountView_Previews: PreviewProvider {
    static var previews: some View {
        DeleteAccountView()
    }
}
