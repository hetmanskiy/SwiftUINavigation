//
//  ViewModel.swift
//  swiftUINavigation
//
//  Created by Mykhailo H on 10/4/22.
//

import Foundation
import Combine

protocol ViewModel: ObservableObject {
    associatedtype Route: Routing
    var router: Route { get set }
}
