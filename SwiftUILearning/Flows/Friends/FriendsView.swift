//
//  FriendsView.swift
//  SwiftUILearning
//
//  Created by Aksilont on 25.10.2021.
//

import SwiftUI

struct FriendsView: View {
    @ObservedObject private var friendsViewModel: FriendsViewModel
    
    init(friendsViewModel: FriendsViewModel) {
        self.friendsViewModel = friendsViewModel
    }

    var body: some View {
        NavigationView {
            List {
                ForEach(friendsViewModel.friends.keys.sorted(by: <), id: \.self) { key in
                    Section(header: Text(key).font(.title)) {
                        ForEach(friendsViewModel.friends[key]!) { currentFriend in
                            NavigationLink(destination: FriendDetailView(friend: currentFriend)) {
                                FriendRow(friend: currentFriend)
                            }
                        }
                    }
                }
            }
            .listStyle(PlainListStyle())
            .navigationTitle("Друзья")
        }
        .onAppear {
            friendsViewModel.fetchFriends()
        }
    }
}

//struct FriendsView_Previews: PreviewProvider {
//    static var previews: some View {
//        FriendsView()
//    }
//}
