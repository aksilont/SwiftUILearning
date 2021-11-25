//
//  Photo.swift
//  SwiftUILearning
//
//  Created by Aksilont on 23.11.2021.
//

import UIKit

struct PhotoSizes: Decodable {
    var height: Int
    var width: Int
    var url: String
    var type: String
    var aspectRatio: CGFloat {
        return CGFloat(height) / CGFloat(width)
    }
}

final class Photo: Identifiable, Decodable {
    var album_id: Double = 0
    var date: TimeInterval = 0
    var id: Int = 0
    var owner_id: Double = 0
    var text: String = ""
    var sizesOfPhoto: [PhotoSizes] = []
    var url: String = ""
    var height: Int = 0
    var width: Int = 0
    var aspectRatio: CGFloat = 1.0
    
    var comments: Int = 0
    var likes: Int = 0
    var reposts: Int = 0
    
    enum CodingKeys: CodingKey {
        case album_id
        case date
        case id
        case owner_id
        case sizes
        case text
        case comments
        case likes
        case reposts
    }

    enum SizesKeys: CodingKey {
        case height
        case url
        case type
        case width
    }
    
    enum StatKeys: String, CodingKey {
        case count
    }
    
    required convenience init(from decoder: Decoder) throws {
        self.init()
        let container = try decoder.container(keyedBy: CodingKeys.self)
        album_id = try container.decode(Double.self, forKey: .album_id)
        date = try container.decode(Double.self, forKey: .date)
        id = try container.decode(Int.self, forKey: .id)
        owner_id = try container.decode(Double.self, forKey: .owner_id)
        text = try container.decode(String.self, forKey: .text)
        sizesOfPhoto = try container.decode([PhotoSizes].self, forKey: .sizes)
        
        if let commentsContainer = try? container.nestedContainer(keyedBy: StatKeys.self, forKey: .comments) {
            comments = try commentsContainer.decode(Int.self, forKey: .count)
        }
        
        if let likesContainer = try? container.nestedContainer(keyedBy: StatKeys.self, forKey: .likes) {
            likes = try likesContainer.decode(Int.self, forKey: .count)
        }
        
        if let repostsContainer = try? container.nestedContainer(keyedBy: StatKeys.self, forKey: .reposts) {
            reposts = try repostsContainer.decode(Int.self, forKey: .count)
        }
        
        url = sizesOfPhoto.last?.url ?? ""
        height = sizesOfPhoto.last?.height ?? 0
        width = sizesOfPhoto.last?.width ?? 0
        aspectRatio = sizesOfPhoto.last?.aspectRatio ?? 1.0
    }
    
}
