//
//  HomeView.swift
//  SwiftUILearning
//
//  Created by Aksilont on 25.10.2021.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        TabView {
            FriendsView()
                .tabItem {
                    Image(systemName: "person.3")
                    Text("Друзья")
                }
                
            GroupsView()
                .tabItem {
                    Image(systemName: "network")
                    Text("Сообщества")
                }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
