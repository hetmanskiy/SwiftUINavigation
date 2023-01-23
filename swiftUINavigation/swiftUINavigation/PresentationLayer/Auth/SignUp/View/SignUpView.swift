//
//  SignUpView.swift
//  swiftUINavigation
//
//  Created by user on 11.10.2022.
//

import SwiftUI

struct SignUpView: BaseView  {
    typealias VM = SignUpViewModel
    
    @ObservedObject var viewModel: VM
    @State var presentedScreen: Screen?
    @State var showLoader = false
    
    init(viewModel: VM) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        ZStack {
            VStack(alignment: .center) {
                UsernameTextField(username: $viewModel.username)
                UserEmailTextField(email: $viewModel.email)
                PasswordSecureField(password: $viewModel.password)
                ConfirmPasswordSecureField(password: $viewModel.password)
                Spacer()
                Button(action: {
                    viewModel.signUpUser()
                }){
                    Text("Sign Up")
                        .bold()
                        .font(Font.custom("Helvetica Neue", size: 24.0))
                        .padding(20)
                        .foregroundColor(Color.white)
                        .background(Color.purple)
                        .cornerRadius(12)
                }
                .disabled(!viewModel.isInputValid)
                Spacer()
            }
            .padding(20)
            .push(isActive: $presentedScreen.presence(),
                  content: { presentedScreen })
            ProgressView("Loading")
                .isHidden(!showLoader)
        }
        .onReceive(viewModel.isLoadingPublisher) { isLoading in
            showLoader.toggle()
        }
        .onReceive(viewModel.errorPublisher) { error in
            print(error)
        }
    }
}
