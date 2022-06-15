//
//  SwipeableTab+TabPage.swift
//  swipeabletabbar
//
//  Created by Serdar Senol on 15/06/2022.
//

import SwiftUI

public extension SwipeableTab {
    struct TabPage {
        let view: AnyView
        let title: String

        public init(view: AnyView,
                    title: String) {
            self.view = view
            self.title = title
        }
    }
}
