//
//  ViewRouter.swift
//  SwiftUILearning
//
//  Created by Aksilont on 25.10.2021.
//

import SwiftUI

class ViewRouter: ObservableObject {
    
    @Published var currentPage: Page = .loginView
    
    enum Page {
        case loginView
        case homeView
    }
}
