//
//  TextInfo.swift
//  SwiftUILearning
//
//  Created by Aksilont on 27.10.2021.
//

import SwiftUI

struct TextInfo: ViewModifier {
    func body(content: Content) -> some View {
        content
            .lineLimit(2)
            .font(.subheadline)
            .foregroundColor(.secondary)
            .multilineTextAlignment(TextAlignment.leading)
    }
}

extension View {
    func infoText() -> some View {
        self.modifier(TextInfo())
    }
}
