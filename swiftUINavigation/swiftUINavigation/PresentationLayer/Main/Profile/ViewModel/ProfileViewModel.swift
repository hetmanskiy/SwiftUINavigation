//
//  ProfileViewModel.swift
//  swiftUINavigation
//
//  Created by user on 14.10.2022.
//

import SwiftUI
import Combine

final class ProfileViewModel: ViewModel {
    // MARK: - Transition Publisher
    private(set) lazy var transitionPublisher = transitionSubject.eraseToAnyPublisher()
    private let transitionSubject = PassthroughSubject<ProfileTransition, Never>()
    
    var router: ProfileRouter
    private var cancellableSet: Set<AnyCancellable> = []
    
    init(router: ProfileRouter) {
        self.router = router
    }
}
