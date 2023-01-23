//
//  MainTabBarRouter.swift
//  swiftUINavigation
//
//  Created by user on 13.10.2022.
//

import Foundation

enum MainTabBarRoute: RouteType {
    case home
    case settings
    case profile
}

class MainTabBarRouter: Routing {
    let homeScreen = Screen(HomeBuilder.build(router: HomeRouter()).view)
    let profileScreen = Screen(ProfileBuilder.build(router: ProfileRouter()).view)
    let settingsScreen = Screen(SettingsBuilder.build(router: SettingsRouter()).view)
    
    func view(for route: MainTabBarRoute) -> Screen {
        switch route {
        case .home:
            return self.homeScreen
        case .profile:
            return self.profileScreen
        case .settings:
           return self.settingsScreen
        }
    }
    
    func getCurrentScreens() -> Screen {
        return Screen {
            homeScreen
            profileScreen
            settingsScreen
        }
    }
}
