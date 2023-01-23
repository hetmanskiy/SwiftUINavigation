//
//  Binding+Presence.swift
//  swiftUINavigation
//
//  Created by user on 11.10.2022.
//

import SwiftUI

extension Binding {
    func presence<T>() -> Binding<Bool> where Value == Optional<T> {
        .init {
            self.wrappedValue != nil
        } set: { newValue in
            precondition(newValue == false)
            self.wrappedValue = nil
        }
    }
}
