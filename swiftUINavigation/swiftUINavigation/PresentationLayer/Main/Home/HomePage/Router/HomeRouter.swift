//
//  HomeRouter.swift
//  swiftUINavigation
//
//  Created by user on 14.10.2022.
//

import Foundation
import Combine

enum HomeRoute: RouteType {
    case customerDetails(Customer)
}

class HomeRouter: Routing {
    private(set) lazy var didFinishPublisher = didFinishSubject.eraseToAnyPublisher()
    private let didFinishSubject = PassthroughSubject<Customer, Never>()
    private var cancellables = Set<AnyCancellable>()
    
    func view(for route: HomeRoute) -> Screen {
        switch route {
        case .customerDetails(let customer):
            let module = CustomerDetailsBuilder.build(router: CustomerDetailsRouter(), customer: customer)
            module.transitionPublisher
                .sink { [unowned self] transition in
                    switch transition {
                    case .success(let customer):
                        didFinishSubject.send(customer)
                    }
                }
                .store(in: &cancellables)
            return Screen(module.view)
        }
    }
}
