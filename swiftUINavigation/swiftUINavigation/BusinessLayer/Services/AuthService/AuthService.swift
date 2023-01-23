//
//  AuthService.swift
//  swiftUINavigation
//
//  Created by user on 11.10.2022.
//

import Foundation
import Combine

enum CustomError: Error {
    case authError
}

struct SignInResponse: Decodable {
    let id: String
    let name: String
    let email: String
    let accessToken: String
}

struct SignUpResponse: Decodable {
    let id: String
    let name: String
    let email: String
    let accessToken: String
}

protocol Network { }
class NetworkImpl: Network {}

protocol AuthService {
    func signIn(email: String, password: String) -> AnyPublisher<SignInResponse, CustomError>
    func signUp(email: String, password: String) -> AnyPublisher<Bool, CustomError>
}

class AuthServiceImpl: AuthService {
    
    private let network: Network
    
    init(network: Network) {
        self.network = network
    }
    
    func signIn(email: String, password: String) -> AnyPublisher<SignInResponse, CustomError> {
        Future<SignInResponse, CustomError> { promise in
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                if password.count > 6 {
                    let model = SignInResponse(id: UUID().uuidString,
                                               name: "Username",
                                               email: email,
                                               accessToken: UUID().uuidString)
                    promise(.success(model))
                } else {
                    promise(.failure(.authError))
                }
            }
        }
        .eraseToAnyPublisher()
    }
    
    func signUp(email: String, password: String) -> AnyPublisher<Bool, CustomError> {
        Future<Bool, CustomError> { promise in
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                if password.count > 4 {
                    promise(.success(true))
                } else {
                    promise(.failure(.authError))
                }
            }
        }
        .eraseToAnyPublisher()
    }
}
