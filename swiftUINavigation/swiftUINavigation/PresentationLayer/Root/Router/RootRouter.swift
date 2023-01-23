//
//  RootRouter.swift
//  swiftUINavigation
//
//  Created by user on 11.10.2022.
//

import SwiftUI
import Combine

enum RootRoute: RouteType {
    case authSelect
    case main
}

struct RootRouter: Routing {
    func view(for route: RootRoute) -> Screen {
        switch route {
        case .authSelect:
            return Screen(AuthSelectBuilder.build(router: AuthSelectRouter()).view)
        case .main:
            return Screen(MainTabBarBuilder.build(router: MainTabBarRouter()))
        }
    }
}

