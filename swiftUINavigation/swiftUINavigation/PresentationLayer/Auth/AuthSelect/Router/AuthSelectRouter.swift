//
//  AuthSelectRouter.swift
//  swiftUINavigation
//
//  Created by user on 11.10.2022.
//

import SwiftUI
import Combine

enum AuthSelectRoute: RouteType {
    case login
    case signup
}

struct AuthSelectRouter: Routing {
    func view(for route: AuthSelectRoute) -> Screen {
        switch route {
        case .login:
            return Screen(LoginBuilder.build(router: LoginRouter()).view)
        case .signup:
            return Screen(SignUpBuilder.build(router: SignUpRouter()).view)
        }
    }
}

