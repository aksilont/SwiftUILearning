//
//  VKService.swift
//  SwiftUILearning
//
//  Created by Aksilont on 07.11.2021.
//

import Foundation

enum NewsfeedType: String {
    case post
    case wall_photo
}

enum VKMethod {
    case friends
    case photos(id: Any)
    case groups(id: Any)
    case searchGroups(text: String)
    case getProfileInfo
    case newsfeedGet(
            startTime: TimeInterval = Date().timeIntervalSinceNow,
            startFrom: String = "",
            count: Int = 10)
    
    var path: String {
        switch self {
        case .friends:
            return "/method/friends.get"
        case .photos:
            return "/method/photos.getAll"
        case .groups:
            return "/method/groups.get"
        case .searchGroups:
            return "/method/groups.search"
        case .getProfileInfo:
            return "/method/account.getProfileInfo"
        case .newsfeedGet:
            return "/method/newsfeed.get"
        }
    }
    
    var parameters: [String: Any] {
        switch self {
        case .friends:
            return ["order": "name", "fields": "country,city,photo_50", "v": "5.122"]
        case let .photos(id):
            return ["owner_id": id, "photo_sizes": "1", "extended": "1", "v": "5.122"]
        case let .groups(id):
            return ["user_id": id, "extended": "1", "v": "5.124"]
        case let .searchGroups(text):
            return ["q": text, "v": "5.122"]
        case .getProfileInfo:
            return ["v": "5.127"]
        case let .newsfeedGet(startTime, startFrom, count):
            return [
                "filters": "post, wall_photo",
                "start_time": startTime,
                "start_from": startFrom,
                "count": count,
                "v": "5.124"]
        }
    }
}

final class VKService {
    private func request(_ method: VKMethod, completion: @escaping (Data?) -> Void) {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "api.vk.com"
        components.path = method.path
        guard let token = UserDefaults.standard.string(forKey: "vkToken") else {
            completion(nil)
            return
        }
        let queryItems = [
            URLQueryItem(name: "access_token", value: token)
        ]
        let methodQueryItems = method.parameters.map { URLQueryItem(name: $0, value: "\($1)") }
        components.queryItems = queryItems + methodQueryItems
        
        guard let url = components.url else {
            completion(nil)
            return
        }
        
        let configuration = URLSessionConfiguration.default
        let session = URLSession(configuration: configuration)
        let task = session.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print("VKService error: \(error.localizedDescription)")
                return
            }
            DispatchQueue.main.async {
                completion(data)
            }
        }
        task.resume()
    }
    
    func loadData<T: Decodable>(_ method: VKMethod,
                                type: T.Type,
                                completion: (([T]) -> Void)? = nil) {
        request(method) { (data) in
            guard let data = data else {
                completion?([])
                return
            }
            do {
                let response = try JSONDecoder().decode(VKResponse<T>.self, from: data)
                completion?(response.items)
            } catch {
                print(error.localizedDescription)
                completion?([])
            }
        }
    }
}
