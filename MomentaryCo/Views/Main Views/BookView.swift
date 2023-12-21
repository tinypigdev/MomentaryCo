//
//  BookView.swift
//  MomentaryCo
//
//  Created by David Higgins on 15/11/2023.
//

import SwiftUI

struct BookView: View {
    
    @EnvironmentObject var router: Router
       
    
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("Book View")
                
                NavigationLink {
                    ProfileView()
                } label: {
                    Text("Profile View")
                }


            }
            .navigationBarBackButtonHidden(true)
        }
    }
}

struct BookView_Previews: PreviewProvider {
    static var previews: some View {
        BookView()
        
    }
}
