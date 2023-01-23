//
//  TabViewModifier.swift
//  swiftUINavigation
//
//  Created by user on 13.10.2022.
//

import Foundation
import SwiftUI

struct TabViewViewModifier: ViewModifier {
    let backgroundColor: Color?
    let itemColor: Color?
    let selectedItemColor: Color?
    let badgeColor: Color?

    func body(content: Content) -> some View {
        VStack {
            content
        }
        .onAppear {
            setupAppearance()
        }
    }

    init(
        backgroundColor: Color? = nil,
        itemColor: Color? = nil,
        selectedItemColor: Color? = nil,
        badgeColor: Color? = nil
    ) {
        self.backgroundColor = backgroundColor
        self.itemColor = itemColor
        self.selectedItemColor = selectedItemColor
        self.badgeColor = badgeColor
    }

    private func setupAppearance() {
        let itemAppearance = UITabBarItemAppearance()
        if let color = itemColor?.uiColor {
            itemAppearance.normal.iconColor = color
            itemAppearance.normal.titleTextAttributes = [
                .foregroundColor: color,
                .font: UIFont.systemFont(ofSize: 10, weight: .medium)
            ]
        }

        if let color = selectedItemColor?.uiColor {
            itemAppearance.selected.iconColor = color
            itemAppearance.selected.titleTextAttributes = [
                .foregroundColor: color,
                .font: UIFont.systemFont(ofSize: 10, weight: .medium)
            ]
        }

        if let color = badgeColor?.uiColor {
            itemAppearance.normal.badgeBackgroundColor = color
            itemAppearance.selected.badgeBackgroundColor = color
        }

        let appearance = UITabBarAppearance()
        if let color = backgroundColor?.uiColor {
            appearance.backgroundColor = color
        }
        
        appearance.shadowColor = .clear
        appearance.shadowImage = UIImage()

        appearance.stackedLayoutAppearance = itemAppearance
        appearance.inlineLayoutAppearance = itemAppearance
        appearance.compactInlineLayoutAppearance = itemAppearance

        UITabBar.appearance().standardAppearance = appearance

        if #available(iOS 15, *) {
            UITabBar.appearance().scrollEdgeAppearance = appearance
        }
    }
}

extension View {
    func tabViewStyle(
        backgroundColor: Color? = nil,
        itemColor: Color? = nil,
        selectedItemColor: Color? = nil,
        badgeColor: Color? = nil
    ) -> some View {
        modifier(TabViewViewModifier(
            backgroundColor: backgroundColor,
            itemColor: itemColor,
            selectedItemColor: selectedItemColor,
            badgeColor: badgeColor
        ))
    }
}
