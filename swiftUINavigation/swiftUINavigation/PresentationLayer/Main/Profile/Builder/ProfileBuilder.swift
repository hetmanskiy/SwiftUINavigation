//
//  ProfileBuilder.swift
//  swiftUINavigation
//
//  Created by user on 14.10.2022.
//

import Foundation
import SwiftUI

enum ProfileTransition: Transition {
    case success
}

final class ProfileBuilder {
    static func build(router: ProfileRouter) -> Module<ProfileTransition, some View> {
        let viewModel = ProfileViewModel(router: router)
        let view = ProfileView(viewModel: viewModel)
        return Module(view: view, transitionPublisher: viewModel.transitionPublisher)
    }
}
