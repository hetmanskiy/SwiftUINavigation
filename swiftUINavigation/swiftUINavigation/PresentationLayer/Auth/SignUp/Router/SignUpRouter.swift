//
//  SignUpRouter.swift
//  swiftUINavigation
//
//  Created by user on 11.10.2022.
//

import SwiftUI
import Combine

enum SignUpRoute: RouteType {
}

struct SignUpRouter: Routing {
    func view(for route: SignUpRoute) -> some View {
        return Screen.empty
    }
}

