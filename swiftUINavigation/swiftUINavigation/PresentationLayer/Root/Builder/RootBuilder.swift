//
//  RootBuilder.swift
//  swiftUINavigation
//
//  Created by user on 11.10.2022.
//

import Foundation

final class RootBuilder: Builder {
    static func build(router: RootRouter) -> RootView {
        let viewModel = RootViewModel(router: router)
        let rootView = RootView(viewModel: viewModel)
        return rootView
    }
}
