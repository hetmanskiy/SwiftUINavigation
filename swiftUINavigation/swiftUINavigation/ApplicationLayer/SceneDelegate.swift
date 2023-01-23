//
//  SceneDelegate.swift
//  swiftUINavigation
//
//  Created by Mykhailo H on 10/4/22.
//

import SwiftUI

final class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        let rootView = RootBuilder.build(router: RootRouter())
//        let rootView = LoginBuilder.build(router: LoginRouter())
        let contentView = rootView

        if let windowScene = scene as? UIWindowScene {
            let window = UIWindow(windowScene: windowScene)
            window.rootViewController = UIHostingController(rootView: contentView)
            self.window = window
            window.makeKeyAndVisible()
        }
    }
}
