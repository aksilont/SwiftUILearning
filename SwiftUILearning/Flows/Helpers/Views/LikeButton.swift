//
//  LikeButton.swift
//  SwiftUILearning
//
//  Created by Aksilont on 15.11.2021.
//

import SwiftUI

struct LikeButton: View {
    @State private var isLiked = false
    @State private var likesCount: Int
    @State private var isPressed = false
    
    init(_ likesCount: Int) {
        self.likesCount = likesCount
    }
    
    var body: some View {
        HStack {
            Image(systemName: isLiked ? "heart.fill" : "heart")
                .foregroundColor(isLiked ? .red : .black)
                .scaleEffect(isPressed ? 1.3 : 1)
                .rotation3DEffect(.degrees(isPressed ? 180 : 0), axis: (x: 0, y: 1, z: 0))
                .onTapGesture {
                    withAnimation {
                        isLiked.toggle()
                        likesCount += isLiked ? 1 : -1
                        isPressed.toggle()
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                            isPressed.toggle()
                        }
                    }
                }
            Text("\(likesCount)")
            Spacer()
        }
    }
}


struct LikeButton_Previews: PreviewProvider {
    static var previews: some View {
        LikeButton(56789)
    }
}
