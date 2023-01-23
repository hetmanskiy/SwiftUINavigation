//
//  HomeViewModel.swift
//  swiftUINavigation
//
//  Created by user on 14.10.2022.
//

import Combine

final class HomeViewModel: ViewModel {
    // MARK: - Transition Publisher
    private(set) lazy var transitionPublisher = transitionSubject.eraseToAnyPublisher()
    private let transitionSubject = PassthroughSubject<HomeTransition, Never>()
    
    var router: HomeRouter
    private var cancellableSet: Set<AnyCancellable> = []
    
    @Published var customers: [Customer] = []
    
    init(router: HomeRouter) {
        self.router = router
        setupPublisher()
    }
    
    func onAppear() {
        if customers.isEmpty {
            customers = getCustomers()
        }
    }
}

private extension HomeViewModel {
    func setupPublisher() {
        router.didFinishPublisher
            .sink { completion in
                    switch completion {
                    case .finished:
                        debugPrint("ok")
                    case .failure(let error):
                        debugPrint(error.localizedDescription)
                    }
            } receiveValue: { [unowned self] customer in
                self.updateCustomer(with: customer)
            }
            .store(in: &cancellableSet)
    }
    
    func getCustomers() -> [Customer] {
        let customers = [
            Customer(name: "John", age: 25, gender: .male),
            Customer(name: "Phillip", age: 20, gender: .male),
            Customer(name: "Selena", age: 19, gender: .female),
            Customer(name: "Marina", age: 29, gender: .female)]
        return customers
    }
    
    func updateCustomer(with customerInfo: Customer) {
        if let cusomerIndex = customers.firstIndex(where: { customer in
            customer.id == customerInfo.id
        }) {
            customers[cusomerIndex] = customerInfo
            print(customers)
        }
    }
}
