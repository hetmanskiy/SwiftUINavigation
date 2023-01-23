//
//  ProfileView.swift
//  swiftUINavigation
//
//  Created by user on 14.10.2022.
//

import SwiftUI

struct ProfileView: BaseView {
    typealias VM = ProfileViewModel
    
    @State var presentedScreen: Screen?
    @ObservedObject var viewModel: VM
    
    init(viewModel: VM) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        VStack {
            Text("Profile")
                .font(.system(size: 30, weight: .bold, design: .rounded))
        }
        .tabItem {
            ZStack {
                Image("profileTabIcon")
                    .padding()
                Text("Profile")
            }
        }
        .tag(MainTabBarRoute.profile)
    }
}

