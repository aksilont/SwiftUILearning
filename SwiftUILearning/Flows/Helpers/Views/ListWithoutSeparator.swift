//
//  ListWithoutSeparator.swift
//  SwiftUILearning
//
//  Created by Aksilont on 27.10.2021.
//

import SwiftUI

struct ListWithoutSeparator<Item, ItemView>: View where Item: Identifiable, ItemView: View {
    var items: [Item]
    var content: (Item) -> (ItemView)
    
    init(items: [Item], @ViewBuilder _ content: @escaping (Item) -> (ItemView)) {
        self.items = items
        self.content = content
    }
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView {
                LazyVStack {
                    ForEach(items) { item in
                        content(item)
                    }
                }
            }
        }
    }
}
