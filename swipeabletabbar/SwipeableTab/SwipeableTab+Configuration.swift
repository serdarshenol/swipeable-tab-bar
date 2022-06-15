//
//  SwipeableTab+Configuration.swift
//  swipeabletabbar
//
//  Created by Serdar Senol on 15/06/2022.
//

import SwiftUI

/// `TabStyle` is the one defines the behaviour of the tab bar. `fixed` is used for when we don't
/// want that tab bar scrolls together with the content. `sticky` refers to the behaviour when tab bar is moving
/// simultaneously with its subviews.
public enum TabStyle: CaseIterable {
    case flat
    case sticky
}

///
/// `style:` Defines tab bars vertical scrolling behaviour
/// `height:` Height for tab bar
/// `minWidth:` Minimum width for tab item in tab bar
/// `spacing:` Defines spacing between tab items
/// `innerPadding:` Padding that is used for title. Defines the space
///  between label in tab item and the container.
/// `underlineHeight` Height for indicator
/// `tabFont` Font for tab item's title
/// `tabForegroundColor` Color for tab item´s title
/// `selectedTabFont` Selected font for tab item's title
/// `selectedTabForegroundColor` Color for selected tab item´s title
/// `backgroundColor` Background color for tab bar
/// `tabBackgroundColor` Background color for each tab
/// `indicatorColor` Color for indicator
/// `dividerColor` Color for divider between tab and subviews
/// `hasShadow` Flag for displaying shadow below tab bar
/// `hasRoundedIndicator` Flag for making indicator's edges rounded
/// `stretchingLimit` Helper number for limiting tab items width,
///  useful for large screens such as iPad.
///
public extension SwipeableTab {
    struct Config {
        let style: TabStyle
        let height: CGFloat
        let minWidth: CGFloat
        let spacing: CGFloat
        let innerPadding: CGFloat
        let underlineHeight: CGFloat
        let tabFont: Font
        let tabForegroundColor: Color
        let selectedTabFont: Font
        let selectedTabForegroundColor: Color
        let backgroundColor: Color
        let tabBackgroundColor: Color
        let indicatorColor: Color
        let dividerColor: Color
        let hasShadow: Bool
        let shadowColor: Color
        let hasRoundedIndicator: Bool
        let stretchingLimit: Int

        public init(style: TabStyle = .flat,
                    height: CGFloat = 48,
                    minWidth: CGFloat = 150,
                    spacing: CGFloat = 16,
                    innerPadding: CGFloat = 0,
                    underlineHeight: CGFloat = 3,
                    tabFont: Font = .system(size: 13, weight: .light, design: .default),
                    tabForegroundColor: Color = .black,
                    selectedTabFont: Font = .system(size: 13, weight: .bold, design: .default),
                    selectedTabForegroundColor: Color = .black,
                    backgroundColor: Color = .clear,
                    tabBackgroundColor: Color = .clear,
                    indicatorColor: Color = .red,
                    dividerColor: Color = .clear,
                    hasShadow: Bool = false,
                    shadowColor: Color = .gray,
                    hasRoundedIndicator: Bool = true,
                    stretchingLimit: Int = 4) {
            self.style = style
            self.height = height
            self.minWidth = minWidth
            self.spacing = spacing
            self.innerPadding = innerPadding
            self.underlineHeight = underlineHeight
            self.tabFont = tabFont
            self.tabForegroundColor = tabForegroundColor
            self.selectedTabFont = selectedTabFont
            self.selectedTabForegroundColor = selectedTabForegroundColor
            self.backgroundColor = backgroundColor
            self.tabBackgroundColor = tabBackgroundColor
            self.indicatorColor = indicatorColor
            self.dividerColor = dividerColor
            self.hasShadow = hasShadow
            self.shadowColor = shadowColor
            self.hasRoundedIndicator = hasRoundedIndicator
            self.stretchingLimit = stretchingLimit
        }
    }
}

