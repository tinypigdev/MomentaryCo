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
        VStack {
            Text("Book View")
            
            Button("Profile View") {
                router.navigate(to: .profile)
            }
        }.navigationBarBackButtonHidden(true)
    }
}

struct BookView_Previews: PreviewProvider {
    static var previews: some View {
        BookView()
        
    }
}
