//
//  HorizontalScrollView.swift
//  swipeabletabbar
//
//  Created by Serdar Senol on 15/06/2022.
//

import SwiftUI

struct HorizontalScrollView<Content>: View where Content: View {
    let alignment: Alignment
    @ViewBuilder let content: Content

    var body: some View {
        GeometryReader { geometry in
            ScrollView(.horizontal, showsIndicators: false) {
                content
                    .frame(minWidth: alignment == .center ? geometry.size.width : .none)
            }
        }
    }
}
