//
//  View+isHidden.swift
//  swiftUINavigation
//
//  Created by user on 11.10.2022.
//

import SwiftUI
extension View {
    @ViewBuilder func isHidden(_ isHidden: Bool) -> some View {
        if isHidden {
            self.hidden()
        } else {
            self
        }
    }
}
