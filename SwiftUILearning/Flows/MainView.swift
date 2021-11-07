//
//  MainView.swift
//  SwiftUILearning
//
//  Created by Aksilont on 21.10.2021.
//

import SwiftUI

struct MainView: View {
    @EnvironmentObject var viewRouter: ViewRouter
    
    var body: some View {
        switch viewRouter.currentPage {
        case .loginView:
            VKLoginWebView()
                .onAppear {
                    NotificationCenter.default.addObserver(forName: NSNotification.Name("vkTokenSaved"),
                                                           object: nil,
                                                           queue: .main) { _ in
                        withAnimation(.easeOut(duration: 0.5)) {
                            viewRouter.currentPage = .homeView
                        }
                    }
                }
        case .homeView:
            HomeView()
                .transition(AnyTransition.scale)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView().environmentObject(ViewRouter())
    }
}
