//
//  View+EmbedNavigationView.swift
//  swiftUINavigation
//
//  Created by user on 11.10.2022.
//

import SwiftUI

public typealias RootPresentationMode = Bool

public final class RootViewManager: ObservableObject {
    @Published public var isPresentedFromRoot = false
}

public struct RootPresentationModeKey: EnvironmentKey {
    public static var defaultValue: Binding<RootPresentationMode> = .constant(RootPresentationMode())
}

public struct RootNavigationView<Content: View>: View {
    @StateObject private var rootViewManager = RootViewManager()
    
    public let content: () -> Content
    
    public var body: some View {
        NavigationView { content() }
        .navigationViewStyle(.stack)
        .environmentObject(rootViewManager)
        .environment(\.rootPresentationMode, $rootViewManager.isPresentedFromRoot)
    }
}

public extension View {
    func embedInRootNavigationView() -> some View {
        RootNavigationView {
            self
                .onAppear {
                    setupAppearance()
                }
        }
    }
    
    private func setupAppearance() {
        UITableViewHeaderFooterView.appearance()
            .tintColor = .clear
        UITableViewHeaderFooterView.appearance()
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = .white
        appearance.shadowColor = nil

        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
    }
}

public extension EnvironmentValues {
    var rootPresentationMode: Binding<RootPresentationMode> {
        get { self[RootPresentationModeKey.self] }
        set { self[RootPresentationModeKey.self] = newValue }
    }
}

public extension RootPresentationMode {
    mutating func dismiss() {
        toggle()
    }
}
