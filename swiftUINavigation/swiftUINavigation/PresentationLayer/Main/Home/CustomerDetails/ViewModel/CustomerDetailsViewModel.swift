//
//  CustomerDetailsViewModel.swift
//  swiftUINavigation
//
//  Created by user on 11.10.2022.
//

import Combine

final class CustomerDetailsViewModel: ViewModel {
    private(set) lazy var transitionPublisher = transitionSubject.eraseToAnyPublisher()
    private let transitionSubject = PassthroughSubject<CustomerDetailsTransition, Never>()
    
    var router: CustomerDetailsRouter
    private var cancellableSet: Set<AnyCancellable> = []
    
    @Published var customer: Customer
    
    init(router: CustomerDetailsRouter, customer: Customer) {
        self.router = router
        self.customer = customer
    }
    
    func saveUser() {
        transitionSubject.send(.success(customer))
    }
}
