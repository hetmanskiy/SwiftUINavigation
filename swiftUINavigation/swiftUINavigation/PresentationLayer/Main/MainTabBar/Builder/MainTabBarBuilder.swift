//
//  MainTabBarBuilder.swift
//  swiftUINavigation
//
//  Created by user on 13.10.2022.
//

import Foundation

final class MainTabBarBuilder: Builder {
    static func build(router: MainTabBarRouter) -> MainTabBarView {
        let viewModel = MainTabBarViewModel(router: router)
        let view = MainTabBarView(viewModel: viewModel)
        return view
    }
}
