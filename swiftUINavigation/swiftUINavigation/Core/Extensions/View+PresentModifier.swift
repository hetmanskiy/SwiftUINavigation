//
//  View+PresentModifier.swift
//  swiftUINavigation
//
//  Created by user on 13.10.2022.
//

import SwiftUI

enum PresentationStyle {
    case sheet
    case fullScreen
}

private struct PresentViewModifier<Destination: View>: ViewModifier {
    @Binding private var isPresented: Bool

    private let style: PresentationStyle
    private let destination: () -> Destination
    private let onDismiss: () -> Void

    init(
        _ style: PresentationStyle,
        isPresented: Binding<Bool>,
        destination: @escaping () -> Destination,
        onDismiss: @escaping () -> Void
    ) {
        self.style = style
        self._isPresented = isPresented
        self.destination = destination
        self.onDismiss = onDismiss
    }

    func body(content: Content) -> some View {
        switch self.style {
        case .sheet:
            content
                .sheet(isPresented: $isPresented, onDismiss: onDismiss) {
                    destination()
                }
        case .fullScreen:
            content
                .fullScreenCover(isPresented: $isPresented, onDismiss: onDismiss, content: {
                    destination()
                        .background(EmptyView())
                        .ignoresSafeArea()
                })
        }
    }
}

extension View {
    func present<Context: View>(
        _ style: PresentationStyle = .fullScreen,
        isPresented: Binding<Bool>,
        @ViewBuilder context: @escaping () -> Context,
        onDismiss: @escaping () -> Void = {}
    ) -> some View {
        modifier(PresentViewModifier(style, isPresented: isPresented, destination: context, onDismiss: onDismiss))
    }
}
