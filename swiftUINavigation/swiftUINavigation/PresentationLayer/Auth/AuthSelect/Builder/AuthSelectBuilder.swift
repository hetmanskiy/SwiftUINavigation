//
//  AuthSelectBuilder.swift
//  swiftUINavigation
//
//  Created by user on 11.10.2022.
//

import Foundation
import SwiftUI

enum AuthSelectTransition: Transition {
    case success
}

final class AuthSelectBuilder {
    static func build(router: AuthSelectRouter) -> Module<AuthSelectTransition, some View> {
        let viewModel = AuthSelectViewModel(router: router)
        let authView = AuthSelectView(viewModel: viewModel)
        return Module(view: authView, transitionPublisher: viewModel.transitionPublisher)
    }
}
