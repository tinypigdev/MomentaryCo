//
//  Parent.swift
//  MomentaryCo
//
//  Created by David Higgins on 14/11/2023.
//

import Foundation
import FirebaseFirestoreSwift

struct Parent: Identifiable, Codable {
    @DocumentID var id: String?
    var parentName = ""
    var address = ""
    var email = ""
    var children: [Child] = []
    
    
    var dictionary: [String: Any] {
        return ["name" : parentName, "address" : address, "email": email, "children": children]
    }
    
    var firstName: String {
        let formatter = PersonNameComponentsFormatter()
                let components = formatter.personNameComponents(from: parentName)
                return components?.givenName ?? ""
    }
    
    var lastName: String {
        let formatter = PersonNameComponentsFormatter()
                let components = formatter.personNameComponents(from: parentName)
                return components?.familyName ?? ""
    }

    var initials: String {
        let formatter = PersonNameComponentsFormatter()
        if let components = formatter.personNameComponents(from: parentName) {
            formatter.style = .abbreviated
            return formatter.string(from: components)
        }
        return ""
    }
    
}
