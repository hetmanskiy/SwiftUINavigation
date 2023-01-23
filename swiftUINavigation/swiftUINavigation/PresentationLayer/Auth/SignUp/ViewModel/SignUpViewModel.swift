//
//  SignUpViewModel.swift
//  swiftUINavigation
//
//  Created by user on 11.10.2022.
//

import Combine
import Foundation
import Resolver

final class SignUpViewModel: ViewModel, ObservableObject {
    // MARK: - Transition publisher
    private(set) lazy var transitionPublisher = transitionSubject.eraseToAnyPublisher()
    private let transitionSubject = PassthroughSubject<SignUpTransition, Never>()
    
    // MARK: - Loading publisher
    private(set) lazy var isLoadingPublisher = isLoadingSubject.eraseToAnyPublisher()
    let isLoadingSubject = PassthroughSubject<Bool, Never>()
    
    // MARK: - Error publisher
    private(set) lazy var errorPublisher = errorSubject.eraseToAnyPublisher()
    let errorSubject = PassthroughSubject<Error, Never>()
    
    @Published var router: SignUpRouter
    private var cancellableSet = Set<AnyCancellable>()
    
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var username: String = ""

    @Published var isEmailValid: Bool = false
    @Published var isPasswordValid: Bool = false
    @Published var isUsernameValid: Bool = false

    @Published var isInputValid: Bool = false
    
    @Injected private var authService: AuthServiceImpl
    @Injected private var userService: UserService
    
    init(router: SignUpRouter) {
        self.router = router
        setupPublishers()
    }
    
    func signUpUser() {
        debugPrint(email, password)
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

private extension SignUpViewModel {
    func setupPublishers() {
        $email
            .map { $0.count > 5 }
            .sink { [unowned self] in isEmailValid = $0 }
            .store(in: &cancellableSet)

        $password
            .map { $0.count > 5 }
            .sink { [unowned self] in isPasswordValid = $0 }
            .store(in: &cancellableSet)

        $isEmailValid.combineLatest($isPasswordValid)
            .map { $0 && $1 }
            .sink { [unowned self] in isInputValid = $0 }
            .store(in: &cancellableSet)
        
        $username
            .map { $0.count > 3 }
            .sink { [unowned self] in isEmailValid = $0 }
            .store(in: &cancellableSet)
    }
}
