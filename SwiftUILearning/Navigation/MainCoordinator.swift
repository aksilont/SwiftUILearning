//
//  MainCoordinator.swift
//  SwiftUILearning
//
//  Created by Aksilont on 22.11.2021.
//

import UIKit
import Combine
import SwiftUI

class MainCoordinator {
    
    let navigationController: UINavigationController
    
    private let loginViewModel: LoginViewModel = LoginViewModel()
    private var cancellables: Set<AnyCancellable> = []
    
    init() {
        let loginView = VKLoginWebView(loginViewModel: loginViewModel).edgesIgnoringSafeArea(.bottom)
        let loginViewController = UIHostingController(rootView: loginView)
        navigationController = UINavigationController(rootViewController: loginViewController)
        navigationController.navigationBar.isHidden = true
    }
    
    public func start() {
        loginViewModel.$isUserLoggedIn.subscribe(on: RunLoop.main).sink { [weak self] isUserLoggedIn in
            guard let self = self else { return }
            if !isUserLoggedIn {
                self.navigationController.popToRootViewController(animated: true)
            } else {
                let mainTabBarController = MainTabBarController()
                self.navigationController.pushViewController(mainTabBarController, animated: true)
            }
        }.store(in: &cancellables)
    }

}
