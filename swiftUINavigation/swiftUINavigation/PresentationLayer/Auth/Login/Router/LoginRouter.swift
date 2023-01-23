//
//  AuthRouter.swift
//  swiftUINavigation
//
//  Created by Mykhailo H on 10/4/22.
//

import Foundation
import SwiftUI
import Combine

enum LoginRoute: RouteType {
    
}

class LoginRouter: Routing {
    func view(for route: LoginRoute) -> Screen {
        return Screen.empty
    }
}

