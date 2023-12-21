//
//  HomeView.swift
//  MomentaryCo
//
//  Created by David Higgins on 15/11/2023.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject var router: Router
    
    
    var body: some View {
        
        VStack {
            Text("Home View")
            
            Image("logo")
                .resizable()
                .scaledToFit()
                .padding()
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
        
    }
}
