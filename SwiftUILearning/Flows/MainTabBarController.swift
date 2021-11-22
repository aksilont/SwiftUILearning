//
//  MainTabBarController.swift
//  SwiftUILearning
//
//  Created by Aksilont on 22.11.2021.
//

import UIKit
import SwiftUI

class MainTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let friendsViewModel = FriendsViewModel(service: VKService())
        let friendsVC = UIHostingController(rootView: FriendsView(friendsViewModel: friendsViewModel))
        friendsVC.tabBarItem = UITabBarItem(title: "Друзья",
                                             image: UIImage(systemName: "person.3"),
                                             selectedImage: UIImage(systemName: "person.3.fill"))
        
        let groupVC = UIHostingController(rootView: GroupsView())
        groupVC.tabBarItem = UITabBarItem(title: "Сообщества",
                                            image: UIImage(systemName: "network"),
                                            selectedImage: UIImage(systemName: "network.badge.shield.half.filled"))
        
        let newsVC = UIHostingController(rootView: NewsView())
        newsVC.tabBarItem = UITabBarItem(title: "Новости",
                                           image: UIImage(systemName: "newspaper"),
                                           selectedImage: UIImage(systemName: "newspaper.fill"))
        
        setViewControllers([friendsVC, groupVC, newsVC], animated: true)
    }

}
