//
//  AddressLookupView.swift
//  MomentaryCo
//
//  Created by David Higgins on 16/11/2023.
//

import SwiftUI
import MapKit

struct AddressLookupView: View {
    @EnvironmentObject var locationManager: LocationManager
    @EnvironmentObject var userViewModel: UserViewModel
    @StateObject var addressViewModel = AddressViewModel()
    @State private var searchText = ""
    @Environment(\.dismiss) private var dismiss
    
    
    var body: some View {
        NavigationStack {
            List(addressViewModel.address) { address in
                VStack(alignment: .leading) {
                    Text(address.address)
                        .font(.title2)
                }
                .onTapGesture {
                    userViewModel.parent.address = address.address
                    dismiss()
                }
            }
            .listStyle(.plain)
            .searchable(text: $searchText)
            .onChange(of: searchText, perform: { text in
                if !text.isEmpty {
                    addressViewModel.search(text: text, region: locationManager.region)
                } else {
                    addressViewModel.address = []
                }
            })
            .toolbar {
                ToolbarItem(placement: .automatic) {
                    Button("Dismiss") {
                        dismiss()
                    }
                }
            }
        }
    }
}

struct AddressLookupView_Previews: PreviewProvider {
    static var previews: some View {
        AddressLookupView()
            .environmentObject(LocationManager())
            .environmentObject(UserViewModel())
    }
}
