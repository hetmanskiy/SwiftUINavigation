//
//  MainTabBarViewModel.swift
//  swiftUINavigation
//
//  Created by user on 13.10.2022.
//

import Combine

final class MainTabBarViewModel: ViewModel {
    var router: MainTabBarRouter
    private var cancellableSet: Set<AnyCancellable> = []
    @Published var selectedTab: MainTabBarRoute = .home
    
    init(router: MainTabBarRouter) {
        self.router = router
    }
}
