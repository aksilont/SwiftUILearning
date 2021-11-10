//
//  CircleImage.swift
//  SwiftUILearning
//
//  Created by Aksilont on 07.11.2021.
//

import Foundation
import SwiftUI

struct CircleImage: ViewModifier {
    func body(content: Content) -> some View {
        content
            .scaledToFill()
            .frame(width: 50, height: 50)
            .clipShape(Circle())
            .overlay(Circle().strokeBorder(.white, lineWidth: 2))
            .shadow(radius: 3)
    }
}

extension View {
    func makeCircleImage() -> some View {
        self.modifier(CircleImage())
    }
}
