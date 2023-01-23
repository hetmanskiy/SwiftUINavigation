//
//  HomeBuilder.swift
//  swiftUINavigation
//
//  Created by user on 14.10.2022.
//

import SwiftUI

enum HomeTransition: Transition {
    case success
}

final class HomeBuilder {
    static func build(router: HomeRouter) -> Module<HomeTransition, some View> {
        let viewModel = HomeViewModel(router: router)
        let view = HomeView(viewModel: viewModel)
        return Module(view: view, transitionPublisher: viewModel.transitionPublisher)
    }
}
