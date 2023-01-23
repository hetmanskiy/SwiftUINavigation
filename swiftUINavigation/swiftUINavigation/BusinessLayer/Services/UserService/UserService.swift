//
//  UserService.swift
//  swiftUINavigation
//
//  Created by user on 13.10.2022.
//

import Foundation
import Combine

final class UserService {
    @Published
    private(set) var user: User?
    private(set) var isLogedIn: Bool = false
    
    func loginUser(email: String?, password: String?) {
        guard let email = email, let password = password else { return }
        user = User(id: UUID().uuidString, email: email, password: password)
        isLogedIn = !isLogedIn
    }
    
    func signUpUser(response: SignInResponse) {
        user = User(id: response.id, email: response.email, password: response.accessToken)
        isLogedIn = !isLogedIn
    }
    
    func logoutUser() {
        user = nil
        isLogedIn = !isLogedIn
    }
}
