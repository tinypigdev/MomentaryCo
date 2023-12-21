//
//  AuthViewModel.swift
//  MomentaryCo
//
//  Created by David Higgins on 14/11/2023.
//

import Foundation
import Firebase

class AuthViewModel: ObservableObject {
    @Published var loggedIn = false
    @Published var user: User?
    
    init() {
        self.user = Auth.auth().currentUser
    }
    
    
    func deleteAccount() {
        
    }
    
    func updateEmail() {
        
    }
    
    func signOut() {
        
    }
    
    func resetPassword() {
        
    }
    
    func reauthenticateWithPassword(email: String, password: String) -> Bool {
        let user = Auth.auth().currentUser
        let credential: AuthCredential = EmailAuthProvider.credential(withEmail: email, password: password)
        var isAuthenticated = false
        user?.reauthenticate(with: credential) { (result, error) in
            if let error = error {
                print("🤬 ERROR: Unable to reauthenticate!")
              isAuthenticated = false
            } else {
                print("😀 User sucessfully reauthenticated!")
                isAuthenticated = true
            }
        }
        return isAuthenticated
    }
}


protocol AuthenticationFormProtocol {
    var formIsValid: Bool { get }
}
