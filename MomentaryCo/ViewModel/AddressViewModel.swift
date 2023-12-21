//
//  AddressViewModel.swift
//  MomentaryCo
//
//  Created by David Higgins on 16/11/2023.
//

import Foundation
import MapKit

@MainActor
class AddressViewModel: ObservableObject {
    @Published var address: [PostalAddress] = []
    
    func search(text: String, region: MKCoordinateRegion) {
        let searchRequest = MKLocalSearch.Request()
        searchRequest.naturalLanguageQuery = text
        searchRequest.region = region
        let search = MKLocalSearch(request: searchRequest)
        
        search.start { response, error in
            guard let response = response else {
                print("🤬 ERROR: \(error?.localizedDescription ?? "Unknown error")")
                return
            }
            self.address = response.mapItems.map(PostalAddress.init)
        }
    }
}
