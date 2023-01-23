//
//  View+Alerts.swift
//  swiftUINavigation
//
//  Created by user on 14.10.2022.
//

import SwiftUI

extension View {
    public func alert<Value, A: View, M: View>(
      title: (Value) -> Text,
      unwrapping value: Binding<Value?>,
      @ViewBuilder actions: @escaping (Value) -> A,
      @ViewBuilder message: @escaping (Value) -> M
    ) -> some View {
      self.alert(
        value.wrappedValue.map(title) ?? Text(""),
        isPresented: value.presence(),
        presenting: value.wrappedValue,
        actions: actions,
        message: message
      )
    }
}
