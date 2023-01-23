//
//  CustomerDetailsTextField.swift
//  swiftUINavigation
//
//  Created by user on 11.10.2022.
//

import SwiftUI

struct CustomerDetailsTextField: View {
    @Binding var value: AnyObject
    var placeholder: String
    
    var body: some View {
        TextField(placeholder, text: $value)
            .padding()
            .background(Color(red: 239.0/255.0, green: 243.0/255.0, blue: 244.0/255.0))
            .cornerRadius(5.0)
            .padding(.bottom, 20)
    }
}
