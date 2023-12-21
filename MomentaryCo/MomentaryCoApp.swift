//
//  MomentaryCoApp.swift
//  MomentaryCo
//
//  Created by David Higgins on 13/11/2023.
//

import SwiftUI
import FirebaseCore
import Firebase

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        return true
    }
}

@main
struct MomentaryCoApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    @ObservedObject var router = Router()
    @ObservedObject var authViewModel = AuthViewModel()
    @ObservedObject var userViewModel = UserViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationStack(path: $router.navPath) {
                
                if  Auth.auth().currentUser != nil {
                    ContentView()
                        .navigationDestination(for: Router.Destination.self) { destination in
                            switch destination {
                            case .settings:
                                SettingsView()
                            case .profile:
                                ProfileView()
                            case .children:
                                ChildrenView ()
                            case .books:
                                BookView()
                            case .home:
                                HomeView()
                            case .login:
                                LoginView()
                            case .content:
                                ContentView()
                            case .
                            }
                        }
                } else {
                    LoginView()
                }
            }
            .environmentObject(router)
            .environmentObject(authViewModel)
            .environmentObject(userViewModel)
        }
    }
}
