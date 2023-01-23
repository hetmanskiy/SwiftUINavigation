//
//  CustomerView.swift
//  swiftUINavigation
//
//  Created by user on 11.10.2022.
//

import SwiftUI

struct CustomerView: View {
    @State var name: String
    @State var age: Int
    @State var gender: Gender
    
    var body: some View {
        ZStack(alignment: .leading){
            RoundedRectangle(cornerRadius: 10.0)
                .fill(Color.blue)
                .frame(height: 100)
            VStack(alignment: .leading){
                Text(name)
                    .foregroundColor(.white)
                    .font(.title)
                Text("\(age)")
                    .foregroundColor(.white)
                    .font(.title2)
                Text(gender.rawValue)
                    .foregroundColor(.white)
                    .font(.title2)
            }
            .padding()
        }
        .padding()
    }
}
