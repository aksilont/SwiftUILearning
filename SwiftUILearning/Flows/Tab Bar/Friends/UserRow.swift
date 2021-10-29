//
//  UserRow.swift
//  SwiftUILearning
//
//  Created by Aksilont on 25.10.2021.
//

import SwiftUI

struct UserRow: View {
    var user: User
    var body: some View {
        VStack(alignment: .leading) {
            Text(user.fullName)
            Text(user.status).infoText()
        }
    }
}


struct UserRow_Previews: PreviewProvider {
    static var previews: some View {
        FriendsView()
    }
}
