//
//  Book.swift
//  MomentaryCo
//
//  Created by David Higgins on 15/10/2023.
//

import Foundation

struct Book: Identifiable, Codable, Hashable {
    let id: String
    let bookName: BookType
    let bookPhotos: [Int : String]
    
}
