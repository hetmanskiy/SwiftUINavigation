//
//  SettingsView.swift
//  swiftUINavigation
//
//  Created by user on 14.10.2022.
//

import SwiftUI

import SwiftUI

struct SettingsView: BaseView {
    typealias VM = SettingsViewModel
    
    @ObservedObject var viewModel: VM
    @State var presentedScreen: Screen?
    
    init(viewModel: VM) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        VStack {
            Text("Settings")
                .font(.system(size: 30, weight: .bold, design: .rounded))
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button("logOut") {
                            viewModel.logout()
                        }
                    }
                }
        }
        .embedInRootNavigationView()
        .tabItem {
            ZStack {
                Image("settingsTabIcon")
                Spacer()
                Text("Settings")
            }
        }
        .tag(MainTabBarRoute.settings)
    }
}

