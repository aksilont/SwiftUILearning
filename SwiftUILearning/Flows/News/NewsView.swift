//
//  NewsView.swift
//  SwiftUILearning
//
//  Created by Aksilont on 28.10.2021.
//

import SwiftUI

struct NewsView: View {
    var news = News.fakeNews()
    
    var body: some View {
        NavigationView {
            ListWithoutSeparator(items: news) { item in
                ItemRow(image: Image(item.photo)) {
                    NavigationLink(destination: NewsDetailView()) {
                        NewsRow(news: item)
                    }
                    .foregroundColor(.black)
                }
            }
            .navigationTitle("Новости")
        }
    }
}

struct NewsView_Previews: PreviewProvider {
    static var previews: some View {
        NewsView()
    }
}
