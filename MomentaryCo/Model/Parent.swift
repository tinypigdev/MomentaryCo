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
    var name = ""
    var address = ""
    
    var dictionary: [String: Any] {
        return ["name" : name, "address" : address]
    }
    
    
    
}
