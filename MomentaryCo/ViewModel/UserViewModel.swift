//
//  UserViewModel.swift
//  MomentaryCo
//
//  Created by David Higgins on 14/11/2023.
//

import Foundation

class UserViewModel: ObservableObject {
   @Published var parent: Parent = Parent()
    @Published var profileCompleted: Bool = false

}
