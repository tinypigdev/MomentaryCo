//
//  Child.swift
//  MomentaryCo
//
//  Created by David Higgins on 14/11/2023.
//

import Foundation
import FirebaseFirestoreSwift
import SwiftUI

struct Child: Identifiable, Codable, Hashable {

    var id: UUID
    var childName: String
    var childBirtday: Date
    var childProfileImage: Data
    var books: [Book]
    
    // Initializer 1: For creating a UserImage instance elsewhere in the app
//    init(id: UUID, childName: String, childBirthday: Date, profileImage: Image, books: [Book]) {
//            self.id = id
//            self.childName = childName
//            self.childBirtday = childBirthday
//            self.profileImage = profileImage
//        }
//
//    init(from decoder: Decoder) throws {
//            let container = try decoder.container(keyedBy: CodingKeys.self)
//
//            id = try container.decode(UUID.self, forKey: .id)
//            childName = try container.decode(String.self, forKey: .childName)
//
//            let imageData = try container.decode(Data.self, forKey: .profileImage)
//        let decodedImage = Image(imageData) ?? Image
//            self.profileImage = decodedImage
//        }
}
