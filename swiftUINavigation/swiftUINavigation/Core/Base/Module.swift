//
//  Module.swift
//  swiftUINavigation
//
//  Created by user on 11.10.2022.
//

import SwiftUI
import Combine

protocol Transition {}

struct Module<T: Transition, V: View> {
    let view: V
    let transitionPublisher: AnyPublisher<T, Never>
}
