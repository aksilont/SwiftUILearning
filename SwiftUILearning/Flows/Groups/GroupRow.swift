//
//  GroupRow.swift
//  SwiftUILearning
//
//  Created by Aksilont on 25.10.2021.
//

import SwiftUI

struct GroupRow: View {
    var group: Group
    var body: some View {
        VStack(alignment: .leading) {
            Text(group.name)
            Text(group.description).infoText()
        }
    }
}

struct GroupRow_Previews: PreviewProvider {
    static var previews: some View {
        GroupsView()
    }
}
