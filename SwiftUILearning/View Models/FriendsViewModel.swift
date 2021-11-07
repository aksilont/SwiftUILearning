//
//  FriendsViewModel.swift
//  SwiftUILearning
//
//  Created by Aksilont on 07.11.2021.
//

import Foundation
import Combine

class FriendsViewModel: ObservableObject {
//    @Published var friends = [String: [Friend]]()
    var friends = [String: [Friend]]()
    let objectWillChange: ObservableObjectPublisher = ObjectWillChangePublisher()
    
    var service: VKService
    
    init(service: VKService) {
        self.service = service
    }
    
    public func fetchFriends() {
        service.loadData(.friends, type: Friend.self) { [unowned self] items in
            self.friends = Dictionary(
                grouping: items,
                by: { "\($0.lastName.first!)" }
            )
            objectWillChange.send()
        }
    }
}
