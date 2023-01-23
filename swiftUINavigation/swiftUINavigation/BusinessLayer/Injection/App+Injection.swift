//
//  App+Injection.swift
//  swiftUINavigation
//
//  Created by user on 13.10.2022.
//

import Foundation
import Resolver

extension Resolver: ResolverRegistering {
    public static func registerAllServices() {
        defaultScope = .cached
        
        register { UserService() }
        register { NetworkImpl() }.implements(Network.self)
        register { AuthServiceImpl(network: NetworkImpl()) }.implements(AuthService.self)
    }
}
