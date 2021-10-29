//
//  Group.swift
//  SwiftUILearning
//
//  Created by Aksilont on 25.10.2021.
//

import Foundation

struct Group: Identifiable, Codable {
    var id = UUID()
    var name: String
    var description: String
    var photo: String
    
    static func fakeGroup() -> [Group] {
        [
            Group(name: "Apple", description: "Все новинки Apple у нас на стене! 😎", photo: "AppleGroup"),
            Group(name: "GeekBrains", description: "Учись, развивайся, стажируйся, зарабатывай!", photo: "GBGroup"),
            Group(name: "SwiftDevelopers", description: "Сообщество разработчиков", photo: "SwiftDevGroup"),
            Group(name: "CocoaHeads", description: "Сообщество iOS разработчиков", photo: "CocoaHeadsGroup")
        ]
    }
}
