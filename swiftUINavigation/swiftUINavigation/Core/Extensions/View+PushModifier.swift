//
//  View+PushModifier.swift
//  swiftUINavigation
//
//  Created by user on 11.10.2022.
//


import SwiftUI

private struct PushViewModifier<Destination: View>: ViewModifier {
    @GestureState private var dragOffset = CGFloat.zero

    @Binding private var isPresented: Bool

    private let destination: () -> Destination
    private let onDismiss: () -> Void

    init(
        isPresented: Binding<Bool>,
        @ViewBuilder destination: @escaping () -> Destination,
        onDismiss: @escaping () -> Void
    ) {
        self._isPresented = isPresented
        self.destination = destination
        self.onDismiss = onDismiss
    }

    func body(content: Content) -> some View {
        content
        NavigationLink(isActive: $isPresented) {
            destination()
                .onDisappear(perform: onDismiss)
        } label: {
            EmptyView()
        }
    }
}

extension View {
    func push<Destination: View>(
        isActive: Binding<Bool>,
        @ViewBuilder content: @escaping () -> Destination,
        onDismiss: @escaping () -> Void = {}
    ) -> some View {
        modifier(PushViewModifier(isPresented: isActive, destination: content, onDismiss: onDismiss))
    }
}
