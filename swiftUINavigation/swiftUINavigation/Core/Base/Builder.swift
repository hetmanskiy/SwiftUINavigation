//
//  Builder.swift
//  swiftUINavigation
//
//  Created by Mykhailo H on 10/4/22.
//

import Foundation
import SwiftUI

protocol Builder {
    associatedtype Body: View
    associatedtype Route: Routing
    static func build(router: Route) -> Self.Body
}
