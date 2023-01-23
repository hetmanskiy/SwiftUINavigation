//
//  LoginBuilder.swift
//  swiftUINavigation
//
//  Created by Mykhailo H on 10/4/22.
//

import Foundation
import SwiftUI

enum LoginTransition: Transition {
    case success
}

final class LoginBuilder {
    static func build(router: LoginRouter) -> Module<LoginTransition, some View> {
        let viewModel = LoginViewModel(router: router)
        let loginView = LoginView(viewModel: viewModel)
        return Module(view: loginView, transitionPublisher: viewModel.transitionPublisher)
    }
}
