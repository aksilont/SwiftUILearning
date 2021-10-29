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
            LoginView()
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
