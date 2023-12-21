//
//  ProfileView.swift
//  MomentaryCo
//
//  Created by David Higgins on 26/9/2023.
//

import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var authViewModel: AuthViewModel
    @EnvironmentObject var userViewModel: UserViewModel
    @State private var showDeleteView = false

    
    var body: some View {
  
            NavigationStack {
                List {
                    Section {
                        HStack {
                            Text(userViewModel.user.initials)
                                .font(.title)
                                .fontWeight(.semibold)
                                .foregroundColor(.white)
                                .frame(width: 72, height: 72)
                                .background(Color(.systemGray3))
                                .clipShape(Circle())
                            
                            VStack(alignment: .leading, spacing: 4) {
                                Text(userViewModel.user.firstName)
                                    .font(.subheadline)
                                    .fontWeight(.semibold)
                                    .padding(.top, 4)
                                Text(userViewModel.user.email)
                                    .font(.footnote)
                                    .foregroundColor(.gray)
                            }
                        }
                    }
                    
                    Section("General") {
                        HStack{
                            SettingsRowView(imageName: "gear", title: "Version", tintColor: Color(.systemGray))
                            Spacer()
                            Text("1.0.0")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                        
                    }
                    
                    Section("Account") {
//                        HStack{
//                            SettingsRowView(imageName: "person.fill", title: "Logged in:", tintColor: Color(.black))
//                            Spacer()
//                            Text("\(Auth.auth().currentUser ?? "")")
//                                .font(.subheadline)
//                                .foregroundColor(.black)
//                        }
                        Button {
                            print("Notification Preferences")
                        } label: {
                            SettingsRowView(imageName: "bell.circle.fill", title: "Notification Preferences", tintColor: .black)
                        }
                    }
                        
                        
                        NavigationLink(destination: UpdateEmailView()) {
                            Button {
                                //                                print("Update Email...")
                            } label: {
                                SettingsRowView(imageName: "square.and.pencil.circle.fill", title: "Update Email", tintColor: .black)
                            }}
                        
                        Button {
                            authViewModel.resetPassword(withEmail: user.email)
                        } label: {
                            SettingsRowView(imageName: "lock.circle.fill", title: "Update Password", tintColor: .black)
                        }
                        
                        Button {
                            viewModel.signOut()
                        } label: {
                            SettingsRowView(imageName: "arrow.left.circle.fill", title: "Sign Out", tintColor: .black)
                        }
                        
                        
                        Button {
                            showDeleteView.toggle()
                        } label: {
                            SettingsRowView(imageName: "xmark.circle.fill", title: "Delete Account", tintColor: .red)
                        }.sheet(isPresented: $showDeleteView, onDismiss: didDismiss) {
                            DeleteAccountView()
                            
                        }
                        
                    }
                }
            
        }
    func didDismiss() {
        showDeleteView = false
    }
}
    
   
struct ProfileView_previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
            .environmentObject(AuthViewModel())
            .environmentObject(UserViewModel())
    }
}
