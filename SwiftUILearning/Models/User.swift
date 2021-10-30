//
//  User.swift
//  SwiftUILearning
//
//  Created by Aksilont on 25.10.2021.
//

import Foundation

struct User: Identifiable, Codable {
    var id = UUID()
    var firstName: String
    var lastName: String
    var status: String
    var photo: String
    
    var fullName: String {
        firstName + " " + lastName
    }
    
    static func fakeUsers() -> [User] {
        [
            User(firstName: "Leanne", lastName: "Graham", status: "hacking the planet...", photo: "user1"),
            User(firstName: "Ervin", lastName: "Howell", status: "afk", photo: "user2"),
            User(firstName: "Clementine", lastName: "Bauch", status: "Overwatch", photo: "user3"),
            User(firstName: "Patricia", lastName: "Lebsack", status: "working...", photo: "user4"),
            User(firstName: "Patricia", lastName: "Lebsack", status: "cinema", photo: "user5"),
            User(firstName: "Chelsey", lastName: "Dietrich", status: "music", photo: "user6"),
            User(firstName: "Kurtis", lastName: "Weissnat", status: "latte", photo: "user7"),
            User(firstName: "Glenna", lastName: "Runolfsdottir", status: "photo", photo: "user8"),
            User(firstName: "Nicholas", lastName: "Reichert", status: "working...", photo: "user9"),
            User(firstName: "Clementina", lastName: "DuBuque", status: "working...", photo: "user10"),
            User(firstName: "Dennis", lastName: "Schulist", status: "working...", photo: "user11")
        ]
    }
}
