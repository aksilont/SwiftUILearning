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
    private var mainCoordinator: MainCoordinator?
    
    func scene(_ scene: UIScene,
               willConnectTo session: UISceneSession,
               options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = scene as? UIWindowScene else { return }
        
        mainCoordinator = MainCoordinator()
        
        let window = UIWindow(windowScene: windowScene)
        window.rootViewController = mainCoordinator?.navigationController
        self.window = window
        window.makeKeyAndVisible()
        
        mainCoordinator?.start()
    }
}
