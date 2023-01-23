//
//  BaseView.swift
//  swiftUINavigation
//
//  Created by Mykhailo H on 10/4/22.
//

import Foundation
import SwiftUI
import Combine

protocol BaseView: View {
    associatedtype VM: ViewModel
    var viewModel: VM { get }
    var presentedScreen: Screen? { get set }
}

