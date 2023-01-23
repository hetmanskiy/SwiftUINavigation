//
//  SignUpBuilder.swift
//  swiftUINavigation
//
//  Created by user on 11.10.2022.
//

import Foundation
import SwiftUI

enum SignUpTransition: Transition {
    case success
}

final class SignUpBuilder {
    static func build(router: SignUpRouter) -> Module<SignUpTransition, some View> {
        let viewModel = SignUpViewModel(router: router)
        let authView = SignUpView(viewModel: viewModel)
        return Module(view: authView, transitionPublisher: viewModel.transitionPublisher)
    }
}
