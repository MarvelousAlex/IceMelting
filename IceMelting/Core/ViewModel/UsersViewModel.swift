//
//  UsersViewModel.swift
//  IceMelting
//
//  Created by Wendy Zhou on 22/4/2025.
//

import Foundation
import Combine

class UsersViewModel: ObservableObject {
    
    @Published var usersList: [Users] = users

    init() {
        self.usersList = users
    }
}
