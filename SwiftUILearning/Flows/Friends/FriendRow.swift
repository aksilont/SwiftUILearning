//
//  FriendRow.swift
//  SwiftUILearning
//
//  Created by Aksilont on 25.10.2021.
//

import SwiftUI
import Kingfisher

struct FriendRow: View {
    var friend: Friend
    
    var body: some View {
        ZStack {
            HStack(spacing: 15) {
                KFImage(URL(string: friend.avatar))
                    .cancelOnDisappear(true)
                    .resizable()
                    .makeCircleImage()
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
