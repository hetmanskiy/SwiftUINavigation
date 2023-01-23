//
//  Router.swift
//  swiftUINavigation
//
//  Created by Mykhailo H on 10/4/22.
//

import Foundation
import SwiftUI

protocol RouteType {}

protocol Routing {
    associatedtype Route: RouteType
    associatedtype Body: View
    @ViewBuilder func view(for route: Route) -> Self.Body
}
