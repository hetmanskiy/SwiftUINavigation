//
//  Screen.swift
//  swiftUINavigation
//
//  Created by user on 11.10.2022.
//

import SwiftUI
import Combine

public struct Screen: View {
    private let anyView: AnyView

    public var body: some View { anyView }

    public init<Content: View>(@ViewBuilder content: () -> Content) {
        self.anyView = content().eraseToAnyView()
    }

    public init<Content: View>(_ content: @autoclosure () -> Content) {
        self.init { content() }
    }
}

public extension Screen {
    static var empty: Screen { Screen(EmptyView()) }
}
