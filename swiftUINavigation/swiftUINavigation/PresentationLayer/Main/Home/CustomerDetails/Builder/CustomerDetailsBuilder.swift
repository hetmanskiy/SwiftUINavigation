//
//  CustomerDetailsBuilder.swift
//  swiftUINavigation
//
//  Created by user on 11.10.2022.
//

import Combine
import SwiftUI

enum CustomerDetailsTransition: Transition {
    case success(Customer)
}

final class CustomerDetailsBuilder {
    static func build(router: CustomerDetailsRouter, customer: Customer) -> Module<CustomerDetailsTransition, some View> {
        let viewModel = CustomerDetailsViewModel(router: router, customer: customer)
        let view = CustomerDetailsView(viewModel: viewModel)
        return Module(view: view, transitionPublisher: viewModel.transitionPublisher)
    }
}
