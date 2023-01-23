//
//  LoginViewModel.swift
//  swiftUINavigation
//
//  Created by Mykhailo H on 10/4/22.
//

import Combine
import Resolver
import Foundation

enum LogInState: String {
    case idle
    case enable
    case disable
}

class LoginViewModel: ViewModel {
    // MARK: - Transition Publisher
    private(set) lazy var transitionPublisher = transitionSubject.eraseToAnyPublisher()
    private let transitionSubject = PassthroughSubject<LoginTransition, Never>()
    
    // MARK: - Loading Publisher
    private(set) lazy var isLoadingPublisher = isLoadingSubject.eraseToAnyPublisher()
    let isLoadingSubject = PassthroughSubject<Bool, Never>()

    // MARK: - Error Publisher
    private(set) lazy var errorPublisher = errorSubject.eraseToAnyPublisher()
    let errorSubject = PassthroughSubject<Error, Never>()
    
    var router: LoginRouter
    private var cancellableSet: Set<AnyCancellable> = []
    @Injected private var authService: AuthServiceImpl
    @Injected private var userService: UserService
    
    
    @Published var email: String = ""
    @Published var password: String = ""
    
    @Published var isEmailValid: Bool = false
    @Published var isPasswordValid: Bool = false
    
    @Published var isInputValid: Bool = false
    
    init(router: LoginRouter) {
        self.router = router
        setupPublishers()
    }
}

extension LoginViewModel {
    func loginUser() {
        isLoadingSubject.send(true)
        authService.signIn(email: email, password: password)
            .receive(on: DispatchQueue.main)
            .sink { [weak self] completion in
                self?.isLoadingSubject.send(false)
                switch completion {
                case .finished:
                    debugPrint("ok")
                    
                case .failure(let error):
                    debugPrint(error.localizedDescription)
                    self?.errorSubject.send(error)
                }
            } receiveValue: { [weak self] response in
                debugPrint("sign in result: ", response)
                self?.userService.signUpUser(response: response)
            }
            .store(in: &cancellableSet)
    }
}

// MARK: - Private Methods
private extension LoginViewModel {
    func setupPublishers() {
        $email
            .map { $0.count > 6 }
            .sink { [unowned self] in isEmailValid = $0 }
            .store(in: &cancellableSet)
        
        $password
            .map { $0.count > 6 }
            .sink { [unowned self] in isPasswordValid = $0 }
            .store(in: &cancellableSet)
        
        $isEmailValid.combineLatest($isPasswordValid)
            .map { $0 && $1 }
            .sink { [unowned self] in isInputValid = $0 }
            .store(in: &cancellableSet)
    }
}
