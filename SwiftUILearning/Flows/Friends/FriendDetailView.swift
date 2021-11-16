//
//  FriendDetailView.swift
//  SwiftUILearning
//
//  Created by Aksilont on 27.10.2021.
//

import SwiftUI

struct FriendDetailView: View {
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    
    var friend: Friend
    var gallary: [String] = (1...1).map{ "gal\($0)" }
    var body: some View {
        ScrollView {
            LazyVGrid(columns: [GridItem()]) {
                ForEach(gallary, id: \.self) { item in
                    VStack {
                        Image(item)
                            .resizable()
                            .scaledToFit()
                        LikeButton()
                            .padding([.leading, .bottom])
                    }
                }
            }
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(
            leading: Button(action: { mode.wrappedValue.dismiss() }) {
                HStack {
                    Image(systemName: "arrow.left")
                    Text(friend.fullName)
                }
            }
        )
    }
}

//struct FriendDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        FriendsView()
//    }
//}
