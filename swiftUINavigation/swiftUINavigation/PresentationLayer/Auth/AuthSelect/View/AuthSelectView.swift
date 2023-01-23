//
//  AuthSelectView.swift
//  swiftUINavigation
//
//  Created by user on 11.10.2022.
//

import SwiftUI
import Combine

struct AuthSelectView: BaseView  {
    typealias VM = AuthSelectViewModel
    
    @ObservedObject var viewModel: VM
    @State var presentedScreen: Screen?
    
    init(viewModel: VM) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        ZStack {
            VStack(alignment: .center) {
                Text("Choose your path")
                    .bold()
                    .font(Font.custom("Helvetica Neue", size: 36.0))
                HStack {
                    Spacer()
                    Button(action: {
                        presentedScreen = viewModel.router.view(for: .login)
                    }){
                        Text("Login")
                            .bold()
                            .font(Font.custom("Helvetica Neue", size: 24.0))
                            .padding(20)
                            .foregroundColor(Color.white)
                            .background(Color.purple)
                            .cornerRadius(12)
                    }
                    Spacer()
                    Button(action: {
                        presentedScreen = viewModel.router.view(for: .signup)
                    }){
                        Text("Sign Up")
                            .bold()
                            .font(Font.custom("Helvetica Neue", size: 24.0))
                            .padding(20)
                            .foregroundColor(Color.white)
                            .background(Color.purple)
                            .cornerRadius(12)
                    }
                    Spacer()
                }
            }
            .padding(20)
            .push(isActive: $presentedScreen.presence(),
                  content: { presentedScreen })
        }
        .embedInRootNavigationView()
    }
}
