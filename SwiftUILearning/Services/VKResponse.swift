//
//  VKResponse.swift
//  SwiftUILearning
//
//  Created by Aksilont on 07.11.2021.
//

import Foundation


struct VKResponse<T: Decodable>: Decodable {
    var count: Int
    var items: [T]
    
    //MARK: - Coding Keys
    enum CodingKeys: String, CodingKey {
        case response
        case count
        case items
    }
    
    //MARK: - Decodable
    init(from decoder: Decoder) throws {
        let mainContainer = try decoder.container(keyedBy: CodingKeys.self)
        let responseContainer = try mainContainer.nestedContainer(keyedBy: CodingKeys.self, forKey: .response)
        self.count = try responseContainer.decodeIfPresent(Int.self, forKey: .count) ?? 0
        self.items = try responseContainer.decode([T].self, forKey: .items)
    }
}
