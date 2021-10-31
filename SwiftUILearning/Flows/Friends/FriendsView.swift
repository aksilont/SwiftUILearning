//
//  FriendsView.swift
//  SwiftUILearning
//
//  Created by Aksilont on 25.10.2021.
//

import SwiftUI

struct FriendsView: View {
    var users = [String: [User]]()
    
    init() {
        users = Dictionary(
            grouping: User.fakeUsers(),
            by: { "\($0.fullName.first!)" }
        )
    }
    
    var body: some View {
        NavigationView {
            List {
                ForEach(users.keys.sorted(by: <), id: \.self) { key in
                    Section(header: Text(key).font(.title)) {
                        ForEach(users[key]!) { item in
                            NavigationLink(destination: FriendDetailView(user: item)) {
                                ItemRow(image: Image(item.photo)) {
                                    UserRow(user: item)
                                }
                            }
                        }
                    }
                }
            }
            .listStyle(PlainListStyle())
            .navigationTitle("Друзья")
        }
    }
}

struct FriendsView_Previews: PreviewProvider {
    static var previews: some View {
        FriendsView()
    }
}
