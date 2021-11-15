//
//  ItemRow.swift
//  SwiftUILearning
//
//  Created by Aksilont on 25.10.2021.
//

import SwiftUI

struct ItemRow<ItemView>: View where ItemView: View {
    @State private var isPressed: Bool = false
    var content: () -> ItemView
    var image: Image
    
    init(image: Image, @ViewBuilder content: @escaping () -> ItemView) {
        self.image = image
        self.content = content
    }
    
    var body: some View {
        ZStack {
            HStack(spacing: 15) {
                image
                    .makeCircleImage()
                    .scaleEffect(isPressed ? 1.2 : 1)
                    .animation(.spring(response: 0.4, dampingFraction: 0.6), value: isPressed)
                    .onTapGesture {
                        isPressed.toggle()
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                            isPressed.toggle()
                        }
                    }
                content()
                Spacer()
            }
            .padding(.leading)
        }
    }
}

struct ItemRow_Previews: PreviewProvider {
    static var previews: some View {
//        FriendsView()
        GroupsView()
    }
}
