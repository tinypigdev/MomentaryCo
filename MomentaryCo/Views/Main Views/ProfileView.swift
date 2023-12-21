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
    @EnvironmentObject var router: Router
    
    @State private var showDeleteView = false
  
    
    
    var body: some View {
        NavigationStack {
            if !userViewModel.profileCompleted {
                VStack {
                    NavigationLink {
                        CreateProfileView()
                    } label: {
                        Text("Click here to complete your profile information")
                    }

                    
                }
                
            } else {
                Text("User: \(userViewModel.parent.parentName)")
                Text("Email: \(userViewModel.parent.email)")
                Text("Child: \(userViewModel.parent.children.count)")
                
            }
            
        }
    }
}

struct ProfileView_previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
            .environmentObject(AuthViewModel())
            .environmentObject(UserViewModel())
            .environmentObject(Router())
    }
}
