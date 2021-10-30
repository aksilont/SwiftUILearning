//
//  FriendsView.swift
//  SwiftUILearning
//
//  Created by Aksilont on 25.10.2021.
//

import SwiftUI

struct FriendsView: View {
    var users: [User] = User.fakeUsers()
    
    var body: some View {
        NavigationView {
            ListWithoutSeparator(items: users) { item in
                ItemRow(image: Image(item.photo)) {
                    NavigationLink(destination: FriendDetailView(user: item)) {
                        UserRow(user: item)
                    }
                    .foregroundColor(.black)
                }
            }
            .navigationTitle("Друзья")
        }
    }
}

struct FriendsView_Previews: PreviewProvider {
    static var previews: some View {
        FriendsView()
    }
}
