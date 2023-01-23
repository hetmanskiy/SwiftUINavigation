//
//  LoginView+Components.swift
//  swiftUINavigation
//
//  Created by Mykhailo H on 10/4/22.
//

import Foundation
import SwiftUI

struct HelloText: View {
    var body: some View {
        Text("Hello you!")
            .font(.largeTitle)
            .fontWeight(.semibold)
            .padding(.bottom, 20)
    }
}

struct UsernameTextField: View {
    
    @Binding var username: String
    
    var body: some View {
        TextField("Username", text: $username)
            .padding()
            .background(Color(red: 239.0/255.0, green: 243.0/255.0, blue: 244.0/255.0))
            .cornerRadius(5.0)
            .padding(.bottom, 20)
    }
}

struct UserEmailTextField: View {
    
    @Binding var email: String
    
    var body: some View {
        TextField("Email", text: $email)
            .padding()
            .background(Color(red: 239.0/255.0, green: 243.0/255.0, blue: 244.0/255.0))
            .cornerRadius(5.0)
            .padding(.bottom, 20)
    }
}

struct PasswordSecureField: View {
    
    @Binding var password: String
    
    var body: some View {
        SecureField("Password", text: $password)
            .padding()
            .background(Color(red: 239.0/255.0, green: 243.0/255.0, blue: 244.0/255.0))
            .cornerRadius(5.0)
            .padding(.bottom, 20)
    }
}

struct ConfirmPasswordSecureField: View {
    
    @Binding var password: String
    
    var body: some View {
        SecureField("Password", text: $password)
            .padding()
            .background(Color(red: 239.0/255.0, green: 243.0/255.0, blue: 244.0/255.0))
            .cornerRadius(5.0)
            .padding(.bottom, 20)
    }
}

struct BackBarButton: View {
    
    private let action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            Text("Back")
                .foregroundColor(.blue)
                .font(.headline)
        }
    }
    
    init(action: @escaping () -> Void = {}) {
        self.action = action
    }
}
