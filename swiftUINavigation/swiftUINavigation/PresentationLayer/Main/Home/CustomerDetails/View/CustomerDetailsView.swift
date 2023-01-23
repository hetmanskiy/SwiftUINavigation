//
//  CustomerDetailsView.swift
//  swiftUINavigation
//
//  Created by user on 11.10.2022.
//


import SwiftUI
import Combine

struct CustomerDetailsView: BaseView {
    typealias VM = CustomerDetailsViewModel
    
    @ObservedObject var viewModel: VM
    @State var presentedScreen: Screen?
    @Environment(\.presentationMode) private var presentationMode
    
    init(viewModel: VM) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        ZStack {
            VStack {
                Spacer()
                TextField("Name", text: $viewModel.customer.name)
                    .padding()
                    .background(Color(red: 239.0/255.0, green: 243.0/255.0, blue: 244.0/255.0))
                    .cornerRadius(5.0)
                    .padding(.bottom, 20)
                TextField("Age", value: $viewModel.customer.age, formatter: NumberFormatter())
                    .padding()
                    .background(Color(red: 239.0/255.0, green: 243.0/255.0, blue: 244.0/255.0))
                    .cornerRadius(5.0)
                    .padding(.bottom, 20)
                Picker("Gender", selection: $viewModel.customer.gender) {
                    Text("Male").tag(Gender.male)
                    Text("Female").tag(Gender.female)
                }
                Button("Save") {
                    viewModel.saveUser()
                    presentationMode.wrappedValue.dismiss()
                }
                Spacer()
            }
        }
    }
}

