//
//  PhotoViewModel.swift
//  SwiftUILearning
//
//  Created by Aksilont on 23.11.2021.
//

import Foundation

class PhotoViewModel: ObservableObject {
    @Published var photos = [Photo]()
    
    var service: VKService = VKService()
    
    public func fetchFriends(userId: Int) {
        service.loadData(.photos(id: userId), type: Photo.self) { [unowned self] items in
            self.photos = items
        }
    }
}
