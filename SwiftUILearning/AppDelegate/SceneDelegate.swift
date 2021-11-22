//
//  SceneDelegate.swift
//  SwiftUILearning
//
//  Created by Aksilont on 22.11.2021.
//

import SwiftUI
import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    
    func scene(_ scene: UIScene,
               willConnectTo session: UISceneSession,
               options connectionOptions: UIScene.ConnectionOptions) {
        print("test")
        guard let windowScene = scene as? UIWindowScene else { return }

        let rootView = MainView().environmentObject(ViewRouter())

        let window = UIWindow(windowScene: windowScene)
        window.rootViewController = UIHostingController(rootView: rootView)
        self.window = window
        window.makeKeyAndVisible()
    }
}
