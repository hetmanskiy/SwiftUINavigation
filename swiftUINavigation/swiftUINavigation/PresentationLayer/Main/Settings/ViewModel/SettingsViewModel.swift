//
//  SettingsViewModel.swift
//  swiftUINavigation
//
//  Created by user on 14.10.2022.
//

import SwiftUI
import Combine
import Resolver

final class SettingsViewModel: ViewModel {
    private(set) lazy var transitionPublisher = transitionSubject.eraseToAnyPublisher()
    private let transitionSubject = PassthroughSubject<SettingsTransition, Never>()
    
    var router: SettingsRouter
    @Injected private var userService: UserService
    private var cancellableSet: Set<AnyCancellable> = []
    
    init(router: SettingsRouter) {
        self.router = router
    }
}

// MARK: - Public
extension SettingsViewModel {
    func logout() {
        userService.logoutUser()
    }
}
