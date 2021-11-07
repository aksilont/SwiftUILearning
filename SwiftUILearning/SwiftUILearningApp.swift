//
//  SwiftUILearningApp.swift
//  SwiftUILearning
//
//  Created by Aksilont on 21.10.2021.
//

import SwiftUI

@main
struct SwiftUILearningApp: App {
    @StateObject private var viewRouter = ViewRouter()
    
    var body: some Scene {
        WindowGroup {
            MainView().environmentObject(viewRouter)
        }
    }
}
