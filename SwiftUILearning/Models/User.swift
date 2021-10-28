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
            User(firstName: "Patricia", lastName: "Lebsack", status: "working...", photo: "user4")
        ]
    }
}
