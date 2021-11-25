//
//  FriendDetailView.swift
//  SwiftUILearning
//
//  Created by Aksilont on 27.10.2021.
//

import SwiftUI

struct FriendDetailView: View {
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    @ObservedObject private var photoViewModel = PhotoViewModel()
    @State private var photoViewHeight: CGFloat? = nil
    
    let columns = [
        GridItem(.flexible(minimum: 0, maximum: .infinity)),
        GridItem(.flexible(minimum: 0, maximum: .infinity)),
    ]
    
    var friend: Friend
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView(.vertical) {
                LazyVGrid(columns: columns) {
                    ForEach(photoViewModel.photos) { item in
                        PhotoView(photo: item)
                            .frame(height: photoViewHeight)
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
        .onPreferenceChange(PhotoHeightPreferenceKey.self) { height in
            photoViewHeight = height
        }
        .padding(.horizontal, 5)
    }
}
