//
//  SettingsBuilder.swift
//  swiftUINavigation
//
//  Created by user on 14.10.2022.
//

import Foundation
import SwiftUI

enum SettingsTransition: Transition {
    case success
}

final class SettingsBuilder {
    static func build(router: SettingsRouter) -> Module<SettingsTransition, some View> {
        let viewModel = SettingsViewModel(router: router)
        let view = SettingsView(viewModel: viewModel)
        return Module(view: view, transitionPublisher: viewModel.transitionPublisher)
    }
}
