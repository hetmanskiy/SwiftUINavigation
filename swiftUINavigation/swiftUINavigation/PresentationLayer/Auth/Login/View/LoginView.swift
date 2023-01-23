//
//  LoginView.swift
//  swiftUINavigation
//
//  Created by Mykhailo H on 10/4/22.
//

import SwiftUI
import Combine

struct LoginView: BaseView  {
    typealias VM = LoginViewModel
    
    @ObservedObject var viewModel: VM
    @State var presentedScreen: Screen?
    @State var isLoginValid = false
    @State var showLoader = false
    
    init(viewModel: VM) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        ZStack {
            VStack {
                HelloText()
                Spacer()
                UsernameTextField(username: $viewModel.email)
                PasswordSecureField(password: $viewModel.password)
                Button("Login") {
                    viewModel.loginUser()
                }.disabled(!isLoginValid)
                Spacer()
                ProgressView()
                    .isHidden(!showLoader)
                Spacer()
                Spacer()
            }
            .padding()
            .push(isActive: $presentedScreen.presence(),
                  content: { presentedScreen })
            .onReceive(viewModel.isLoadingPublisher) { isLoading in
                showLoader.toggle()
            }
            .onReceive(viewModel.errorPublisher) { error in
                print(error)
            }
            .onReceive(viewModel.$isInputValid) { isValid in
                isLoginValid = isValid
            }
        }
    }
}
