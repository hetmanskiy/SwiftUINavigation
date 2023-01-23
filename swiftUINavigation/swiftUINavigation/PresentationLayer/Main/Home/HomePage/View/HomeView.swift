//
//  HomeView.swift
//  swiftUINavigation
//
//  Created by user on 14.10.2022.
//

import SwiftUI

struct HomeView: BaseView {
    typealias VM = HomeViewModel
    
    @ObservedObject var viewModel: VM
    @State var presentedScreen: Screen?
    
    init(viewModel: VM) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        ZStack {
            VStack {
                List($viewModel.customers, id: \.self) { $item in
                    CustomerView(name: item.name, age: item.age, gender: item.gender)
                        .onTapGesture {
                            presentedScreen = viewModel.router.view(for: .customerDetails(item))
                        }
                }
            }
            .onAppear {
                viewModel.onAppear()
            }
            .push(isActive: $presentedScreen.presence(), content: {
                presentedScreen
            })
            .present(isPresented: $presentedScreen.presence() , context: {
                presentedScreen
            })
        }
        .embedInRootNavigationView()
        .tabItem {
            ZStack {
                Image("homeTabIcon")
                    .padding()
                Text("Home")
            }
        }
        .tag(MainTabBarRoute.home)
    }
}
