//
//  PostalAddress.swift
//  MomentaryCo
//
//  Created by David Higgins on 16/11/2023.
//

import Foundation
import MapKit

struct PostalAddress: Identifiable {
    let id = UUID().uuidString
    private var mapItem: MKMapItem
    
    init(mapItem: MKMapItem) {
        self.mapItem = mapItem
    }
    
    var name: String {
        self.mapItem.name ?? ""
    }
    
    var address: String {
        let placemark = self.mapItem.placemark
        var cityAndState = ""
        var address = ""
        var subthoroughfare = ""
        cityAndState = placemark.locality ?? "" //city
        
        if let state = placemark.administrativeArea {
            // Show either state or city, state
            cityAndState = cityAndState.isEmpty ? state : "\(cityAndState), \(state)"
        }
        address = placemark.subThoroughfare ?? "" // address #
        if let street = placemark.thoroughfare {
            //Just show the street unless there is a street # then add a space + street
            address = address.isEmpty ? street : "\(address) \(street)"
        }
        
        if address.trimmingCharacters(in: .whitespaces).isEmpty && cityAndState.isEmpty {
            //No address? Then just cityAndState with no space
            address = cityAndState
        } else {
            // No cityAndState? Then just address, otherwise Address, cityAndState
            address = cityAndState.isEmpty ? address : "\(address) \(cityAndState)"
        }
        return address
    }
    
    var latitude: CLLocationDegrees {
        self.mapItem.placemark.coordinate.latitude
    }
    var longitude: CLLocationDegrees {
        self.mapItem.placemark.coordinate.longitude
    }
}
