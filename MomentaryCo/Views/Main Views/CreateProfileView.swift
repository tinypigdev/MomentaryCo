//
//  CreateProfileView.swift
//  MomentaryCo
//
//  Created by David Higgins on 14/11/2023.
//

import SwiftUI
import MapKit

struct CreateProfileView: View {
    
    @EnvironmentObject var locationManager: LocationManager
    @State private var parentName = ""
    @State private var returnedAddress = PostalAddress(mapItem: MKMapItem())
    @EnvironmentObject var userViewModel: UserViewModel
    @State private var showPlaceLookupSheet = false
    @State private var showAddChildView = false
    
    
    
    var body: some View {
        NavigationStack {
            VStack  (alignment: .leading) {
                
                Text("Parent or caregiver Name:")
                TextField("Name", text: $userViewModel.parent.parentName)
                    .font(.title2)
                Text("Please enter your address:")
                TextField("Address", text: $userViewModel.parent.address)
                    .font(.title2)
                
                Button {
                    showAddChildView.toggle()
                } label: {
                    Text("Add Child")
                }
                
                
                
                
                //                Button {
                //                    showPlaceLookupSheet.toggle()
                //                } label: {
                //                    HStack{
                //                        Image(systemName: "magnifyingglass")
                //                        Text("Search Address")
                //
                //                    }
                //                }
                //                .buttonStyle(.borderedProminent)
                //                .padding()
                
                
                Spacer()
                
                Text("CURRENT VIEW: Create Profile view")
                    .foregroundColor(.red)
                
                
                
                
            }
            .padding()
            .toolbar {
                ToolbarItem(placement: .bottomBar) {
                    Button {
                        showPlaceLookupSheet.toggle()
                    } label: {
                        Image(systemName: "magnifyingglass")
                        Text("Lookup Address")
                    }
                    
                }
            }
            .navigationBarBackButtonHidden(true)
        }
        .fullScreenCover(isPresented: $showPlaceLookupSheet) {
            AddressLookupView()
        }
        .popover(isPresented: $showAddChildView) {
                    AddChildView()
                }
        }
    
}

struct CreateProfileView_Previews: PreviewProvider {
    static var previews: some View {
        CreateProfileView()
            .environmentObject(LocationManager())
            .environmentObject(UserViewModel())
    }
}
