//
//  FriendDetailView.swift
//  SwiftUILearning
//
//  Created by Aksilont on 27.10.2021.
//

import SwiftUI

struct FriendDetailView: View {
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    
    var user: User
    var gallary: [String] = (1...11).map{ "gal\($0)" }
    var body: some View {
        ScrollView {
            LazyVGrid(columns: [GridItem()]) {
                ForEach(gallary, id: \.self) { item in
                    Image(item)
                        .resizable()
                        .scaledToFit()
                }
            }
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(
            leading: Button(action: { mode.wrappedValue.dismiss() }) {
                HStack {
                    Image(systemName: "arrow.left")
                    Text(user.fullName)
                }
            }
        )
    }
}

struct FriendDetailView_Previews: PreviewProvider {
    static var previews: some View {
        FriendDetailView(user: User.fakeUsers()[0])
    }
}
