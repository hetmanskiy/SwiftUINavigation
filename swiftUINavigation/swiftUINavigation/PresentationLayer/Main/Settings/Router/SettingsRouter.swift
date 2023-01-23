//
//  SettingsRouter.swift
//  swiftUINavigation
//
//  Created by user on 14.10.2022.
//

import SwiftUI
import Combine

enum SettingsRoute: RouteType {
}

class SettingsRouter: Routing {    
    func view(for route: SettingsRoute) -> Screen {
        return Screen.empty
    }
}
