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
        let friendsView = UIHostingController(rootView: FriendsView(friendsViewModel: friendsViewModel))
        friendsView.tabBarItem = UITabBarItem(title: "Друзья",
                                             image: UIImage(systemName: "person.3"),
                                             selectedImage: UIImage(systemName: "person.3.fill"))
        
        let groupView = UIHostingController(rootView: GroupsView())
        groupView.tabBarItem = UITabBarItem(title: "Сообщества",
                                            image: UIImage(systemName: "network"),
                                            selectedImage: UIImage(systemName: "network.badge.shield.half.filled"))
        
        let newsView = UIHostingController(rootView: NewsView())
        newsView.tabBarItem = UITabBarItem(title: "Новости",
                                           image: UIImage(systemName: "newspaper"),
                                           selectedImage: UIImage(systemName: "newspaper.fill"))
        
        setViewControllers([friendsView, groupView, newsView], animated: true)
    }

}
