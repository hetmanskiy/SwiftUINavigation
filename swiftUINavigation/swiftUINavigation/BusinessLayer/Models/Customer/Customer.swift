//
//  Customer.swift
//  swiftUINavigation
//
//  Created by user on 11.10.2022.
//

import Foundation

struct Customer: Hashable {
    var id = UUID()
    var name: String
    var age: Int
    var gender: Gender
}

enum Gender: String {
    case male
    case female
}
