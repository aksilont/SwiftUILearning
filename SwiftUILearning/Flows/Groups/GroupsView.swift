//
//  GroupsView.swift
//  SwiftUILearning
//
//  Created by Aksilont on 25.10.2021.
//

import SwiftUI

struct GroupsView: View {
    var groups: [Group] = Group.fakeGroup()
    
    var body: some View {
        NavigationView {
            ListWithoutSeparator(items: groups) { item in
                ItemRow(image: Image(item.photo)) {
                    NavigationLink(destination: GroupDetailView()) {
                        GroupRow(group: item)
                    }
                    .foregroundColor(.black)
                }
            }
            .navigationTitle("Сообщества")
        }
    }
}

struct GroupsView_Previews: PreviewProvider {
    static var previews: some View {
        GroupsView()
    }
}
