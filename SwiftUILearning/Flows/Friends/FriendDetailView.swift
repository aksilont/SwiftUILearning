//
//  FriendDetailView.swift
//  SwiftUILearning
//
//  Created by Aksilont on 27.10.2021.
//

import SwiftUI
import Kingfisher

struct FriendDetailView: View {
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    @ObservedObject private var photoViewModel = PhotoViewModel()
    
    let columns = [
        GridItem(.flexible(minimum: 0, maximum: .infinity)),
        GridItem(.flexible(minimum: 0, maximum: .infinity)),
    ]
    
    var friend: Friend
    var body: some View {
        GeometryReader { geometry in
            ScrollView(.vertical) {
                LazyVGrid(columns: columns, alignment: .center, spacing: 16) {
                    ForEach(photoViewModel.photos) { item in
                        VStack {
                            KFImage(URL(string: item.url))
                                .resizable()
                                .scaledToFit()
                            LikeButton(item.likes)
                                .padding(.leading)
                        }
                        .frame(height: geometry.size.width / 2)
                        .padding()
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
        .onAppear {
            photoViewModel.fetchFriends(userId: friend.id)
        }
        
    }
}
