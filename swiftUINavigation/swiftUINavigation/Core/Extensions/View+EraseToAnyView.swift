//
//  View+EraseToAnyView.swift
//  swiftUINavigation
//
//  Created by user on 11.10.2022.
//

import SwiftUI

public extension View {
    func eraseToAnyView() -> AnyView {
        AnyView(self)
    }
}
