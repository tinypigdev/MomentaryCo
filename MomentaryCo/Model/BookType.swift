//
//  BookType.swift
//  MomentaryCo
//
//  Created by David Higgins on 15/10/2023.
//

import Foundation

enum BookType: String, CaseIterable, Codable, RawRepresentable, Identifiable {
    case dad
    case me
    case mum
    var id: Self { self }

}
