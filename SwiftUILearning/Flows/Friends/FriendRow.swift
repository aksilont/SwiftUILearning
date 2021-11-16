//
//  FriendRow.swift
//  SwiftUILearning
//
//  Created by Aksilont on 25.10.2021.
//

import SwiftUI
import Kingfisher

struct FriendRow: View {
    @State private var isPressed: Bool = false
    var friend: Friend
    
    var body: some View {
        ZStack {
            HStack(spacing: 15) {
                KFImage(URL(string: friend.avatar))
                    .cancelOnDisappear(true)
                    .resizable()
                    .makeCircleImage()
                    .scaleEffect(isPressed ? 1.2 : 1)
                    .animation(.spring(response: 0.4, dampingFraction: 0.6), value: isPressed)
                    .onTapGesture {
                        isPressed.toggle()
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                            isPressed.toggle()
                        }
                    }
                VStack(alignment: .leading) {
                    Text(friend.fullName)
                    Text(friend.countryTitle).infoText()
                }
                Spacer()
            }
            .padding(.leading)
        }
    }
}


struct UserRow_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
