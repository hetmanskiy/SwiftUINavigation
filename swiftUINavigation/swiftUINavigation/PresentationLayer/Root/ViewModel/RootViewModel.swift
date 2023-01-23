//
//  RootViewModel.swift
//  swiftUINavigation
//
//  Created by user on 11.10.2022.
//


import Combine
import Resolver

final class RootViewModel: ViewModel, ObservableObject {
    @Published var router: RootRouter
    private var cancellableSet: Set<AnyCancellable> = []
    @Injected private var userService: UserService
    @Published var isLoginSuccessed: Bool = false
    
    init(router: RootRouter) {
        self.router = router
    }
    
    func checkIfUserLoggedIn() {
        userService
            .$user
            .map { $0 != nil }
            .sink { [unowned self ] in showMainScreen($0) }
            .store(in: &cancellableSet)
    }
}

// MARK: - Private
private extension RootViewModel {
    final func showMainScreen(_ show: Bool) {
        isLoginSuccessed = show
    }
}
