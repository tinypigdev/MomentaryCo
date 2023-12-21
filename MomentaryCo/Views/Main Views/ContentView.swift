//
//  LoggedInView.swift
//  MomentaryCo
//
//  Created by David Higgins on 13/11/2023.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.dismiss) private var dismiss
    @EnvironmentObject var authViewModel: AuthViewModel
    @EnvironmentObject var userViewModel: UserViewModel
    @EnvironmentObject var router: Router
    
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                        Label("Home", systemImage: "house.fill")
                    }
            BookView()
                .tabItem {
                        Label("Books", systemImage: "book.fill")
                    }
            ChildrenView()
                .tabItem {
                        Label("Children", systemImage: "figure.and.child.holdinghands")
                    }
            ProfileView()
                .tabItem {
                        Label("Profile", systemImage: "person.crop.circle.fill")
                    }
            SettingsView()
                .tabItem {
                        Label("Settings", systemImage: "gearshape.fill")
                    }
        }
        .navigationBarBackButtonHidden(true)
    }
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(AuthViewModel())
            .environmentObject(UserViewModel())
    }
}
