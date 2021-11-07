//
//  Friend.swift
//  SwiftUILearning
//
//  Created by Aksilont on 25.10.2021.
//

import Foundation

struct Friend: Identifiable, Decodable {
    var id: Int = 0
    var firstName: String = ""
    var lastName: String = ""
    var status: String = ""
    var avatar: String = ""
    var countryId: Int = 0
    var countryTitle: String = ""
    
    var fullName: String {
        firstName + " " + lastName
    }

    enum CodingKeys: String, CodingKey {
        case id
        case firstName = "first_name"
        case lastName = "last_name"
        case avatar = "photo_50"
        case country
    }
    
    enum CountryKeys: String, CodingKey {
        case id
        case title
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(Int.self, forKey: .id)
        firstName = try container.decode(String.self, forKey: .firstName)
        lastName = try container.decode(String.self, forKey: .lastName)
        avatar = try container.decode(String.self, forKey: .avatar)
        
        if let countryContainer = try? container.nestedContainer(keyedBy: CountryKeys.self, forKey: .country) {
            countryId = try countryContainer.decode(Int.self, forKey: .id)
            countryTitle = try countryContainer.decode(String.self, forKey: .title)
        }
    }
    
}
