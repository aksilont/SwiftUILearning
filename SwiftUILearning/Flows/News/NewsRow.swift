//
//  NewsRow.swift
//  SwiftUILearning
//
//  Created by Aksilont on 28.10.2021.
//

import SwiftUI

struct NewsRow: View {
    var news: News
    var body: some View {
        VStack(alignment: .leading) {
            Text(news.title).lineLimit(1)
            Text(news.text).infoText()
        }
    }
}

struct NewsRow_Previews: PreviewProvider {
    static var previews: some View {
        NewsView()
    }
}
