//
//  RootView.swift
//  swiftUINavigation
//
//  Created by user on 11.10.2022.
//

import SwiftUI
import Combine

struct RootView: BaseView  {
    typealias VM = RootViewModel
    
    @ObservedObject var viewModel: VM
    @State var presentedScreen: Screen?
    
    init(viewModel: VM) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        presentedScreen
            .onAppear {
                viewModel.checkIfUserLoggedIn()
            }
            .onReceive(viewModel.$isLoginSuccessed) { isLogin in
                presentedScreen = isLogin ? viewModel.router.view(for: .main) : viewModel.router.view(for: .authSelect)
            }
    }
}
