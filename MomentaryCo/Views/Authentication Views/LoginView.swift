//
//  ContentView.swift
//  MomentaryCo
//
//  Created by David Higgins on 13/11/2023.
//

import SwiftUI
import Firebase

struct LoginView: View {
    enum Field {
        case email, password
    }
    @State private var email = ""
    @State private var password = ""
    @State private var buttonsDisabled = true
    @State private var showingAlert = false
    @State private var alertMessage = ""
    @FocusState private var focusField: Field?
    
    @EnvironmentObject var router: Router
    @EnvironmentObject var authViewModel: AuthViewModel
    
    var body: some View {
        VStack {
            Image("logo")
                .resizable()
                .scaledToFit()
                .padding()
            
            Group {
                TextField("Email", text: $email)
                    .autocorrectionDisabled()
                    .autocapitalization(.none)
                    .keyboardType(.emailAddress)
                    .submitLabel(.next)
                    .focused($focusField, equals: .email)
                    .onSubmit {
                        focusField = .password //moves focus to password field
                    }
                    .onChange(of: email) { _ in
                        enableButtons()
                    }
                
                SecureField("Password", text: $password)
                    .autocorrectionDisabled()
                    .autocapitalization(.none)
                    .submitLabel(.done)
                    .focused($focusField, equals: .password)
                    .onSubmit {
                        focusField = nil //will dismiss keyboard
                    }
                    .onChange(of: password) { _ in
                        enableButtons()
                    }
            }
            .textFieldStyle(.roundedBorder)
            .overlay {
                RoundedRectangle(cornerRadius: 5)
                    .stroke(.gray.opacity(0.5), lineWidth: 2)
            }
            .padding(.horizontal)
            
            
            HStack {
                Button {
                    signIn()
                } label: {
                    Text("Log In")
                }
                .padding(.trailing)
                Button {
                    register()
                } label: {
                    Text("Register")
                }
                .padding(.leading)
            }
            
            .disabled(buttonsDisabled)
            .buttonStyle(.borderedProminent)
            .font(.title2)
            .padding(.top)
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarBackButtonHidden(true)
            .alert(alertMessage, isPresented: $showingAlert) {
                Button("OK", role: .cancel) { }
                    .onChange(of: authViewModel.loggedIn) { newValue in
                        if Auth.auth().currentUser != nil {
                            Task {
                                authViewModel.loggedIn = true
                                await MainActor.run {
                                    router.navigate(to: .home)
                                }
                                print("🪵 Login successful!")
                            }
                        } else {
                            router.navigate(to: .login)
                        }
                    }
            }
        }
    }
    
    //TODO: Fix this email and password validation, use stewart lynch code from his firebase 2020 tutorial
    func enableButtons() {
        let emailIsGood = email.count > 6 && email.contains("@")
        let passwordIsGood = password.count > 6
        buttonsDisabled = !(emailIsGood && passwordIsGood)
    }
    
    func register() {
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let error = error { //registration error occured
                print("🤬 REGISTRATION ERROR: \(error.localizedDescription)")
                alertMessage = error.localizedDescription
                showingAlert = true
                
            } else {
                print("😎 Registration success!")
                //                path.append("ContentView")
            }
        }
    }
    
    func signIn() {
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error = error { //login error occured
                print("🤬 LOGIN ERROR: \(error.localizedDescription)")
                alertMessage = error.localizedDescription
                showingAlert = true
                
            } else {
                print("🪵 Login successful!")
                authViewModel.loggedIn = true
                router.navigate(to: .content)
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
            .environmentObject(AuthViewModel())
    }
}
