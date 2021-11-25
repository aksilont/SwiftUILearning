//
//  PhotoView.swift
//  SwiftUILearning
//
//  Created by Aksilont on 24.11.2021.
//

import SwiftUI
import Kingfisher

struct PhotoHeightPreferenceKey: PreferenceKey {
    static var defaultValue: CGFloat = 100
    
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = max(value, nextValue())
    }
}

struct PhotoView: View {
    var photo: Photo
    var body: some View {
        GeometryReader { proxy in
            VStack {
                KFImage(URL(string: photo.url))
                    .cancelOnDisappear(true)
                    .resizable()
                    .scaledToFit()
                LikeButton(photo.likes)
                    .padding(.leading)
            }
            .preference(key: PhotoHeightPreferenceKey.self, value: proxy.size.width)
        }
    }
}
