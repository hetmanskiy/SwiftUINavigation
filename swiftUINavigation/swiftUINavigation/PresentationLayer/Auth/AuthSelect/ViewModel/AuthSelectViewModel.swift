//
//  AuthSelectViewModel.swift
//  swiftUINavigation
//
//  Created by user on 11.10.2022.
//

import Combine
import Resolver

final class AuthSelectViewModel: ViewModel, ObservableObject {
    private(set) lazy var transitionPublisher = transitionSubject.eraseToAnyPublisher()
    private let transitionSubject = PassthroughSubject<AuthSelectTransition, Never>()
    
    @Published var router: AuthSelectRouter
    private var cancellableSet: Set<AnyCancellable> = []
    
    init(router: AuthSelectRouter) {
        self.router = router
    }
}
