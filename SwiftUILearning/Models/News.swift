//
//  News.swift
//  SwiftUILearning
//
//  Created by Aksilont on 28.10.2021.
//

import Foundation

struct News: Identifiable, Codable {
    var id = UUID()
    var title: String
    var text: String
    var author: String
    var comments: Int = 0
    var likes: Int = 0
    var reposts: Int = 0
    var views: Int = 0
    var photo: String = "wal"
    
    static func fakeNews() -> [News] {
        [
            News(title: "sunt aut facere repellat provident occaecati excepturi optio reprehenderit",
                 text: "quia et suscipit\nsuscipitur nderit moest autem sunt rem eveniet architecto",
                 author: "Bar"),
            News(title: "qui est esse",
                 text: "est rerum tempore vitae\nsequi sint nihil reprehenderit dolor beatae ea dolores neque\nfugiat",
                 author: "Lorem"),
            News(title: "dolorem eum magni eos aperiam quia",
                 text: "ut aspernatur corporis harum nihil quis provident sequi\nmollitia nobi",
                 author: "Foo")
        ]
    }
}
