//
//  User.swift
//  swiftUINavigation
//
//  Created by user on 13.10.2022.
//

import Foundation

final class User: ObservableObject {
    let id: String
    let email: String
    let password: String
   
    init(id: String, email: String, password: String) {
        self.id = id
        self.email = email
        self.password = password
    }
}
