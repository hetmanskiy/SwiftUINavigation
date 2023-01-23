//
//  MainTabBarView.swift
//  swiftUINavigation
//
//  Created by user on 13.10.2022.
//

import SwiftUI

struct MainTabBarView: BaseView {
    typealias VM = MainTabBarViewModel
    
    @ObservedObject var viewModel: VM
    @State var presentedScreen: Screen?
    
    init(viewModel: VM) {
        self.viewModel = viewModel
    }
    
    public var body: some View {
        TabView(selection: $viewModel.selectedTab) {
            viewModel.router.getCurrentScreens()
        }
        .tabViewStyle(
            backgroundColor: .white,
            itemColor: Color.blue,
            selectedItemColor: Color.orange
        )
        .present(.fullScreen, isPresented: $presentedScreen.presence()) {
            presentedScreen
                .navigationBarHidden(true)
                .embedInRootNavigationView()
        }
    }
}
