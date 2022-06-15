//
//  SwipeableTab.swift
//  swipeabletabbar
//
//  Created by Serdar Senol on 15/06/2022.
//

import SwiftUI

public struct SwipeableTab: View {
    @Namespace var namespace

    @State var selectedTab: Int = 0
    @State var innerPadding: CGFloat
    @State var isScrolling: Bool = false

    let configuration: Config
    let pages: [TabPage]

    public init(pages: [TabPage],
                configuration: Config = .init()) {
        self.configuration = configuration
        self.pages = pages
        self.innerPadding = configuration.innerPadding
    }

    public var body: some View {
        switch configuration.style {
        case .flat:
            content
        case .sticky:
            stickyContent
        }
    }

    var stickyContent: some View {
        GeometryReader { geometry in
            ScrollView {
                VStack {
                    content
                }
                .frame(height: geometry.size.height)
            }
        }
    }

    var content: some View {
        ZStack(alignment: .top) {
            TabView(selection: self.$selectedTab, content: {
                ForEach(Array(pages.map { item in item.view }.enumerated()), id: \.0) { index, view in
                    view.eraseToAnyView()
                        .tag(index)
                }
            })
            .tabViewStyle(.page(indexDisplayMode: .never))
            .animation(.easeInOut, value: selectedTab)
            .transition(.slide)
            .edgesIgnoringSafeArea(.all)
            .padding(.top, configuration.height)
            VStack(spacing: 0) {
                if configuration.style == .flat {
                    divider
                }
                if configuration.style == .sticky {
                    shadow
                }
            }
            tabBar
        }
    }

    private var tabBar: some View {
        GeometryReader { geometry in
            ScrollViewReader { proxy in
                HorizontalScrollView(alignment: pages.count >= configuration.stretchingLimit ? .leading : .center) {
                    HStack(spacing: configuration.spacing) {
                        ForEach(Array(pages.map { item in item.title }.enumerated()), id: \.0, content: { index, title in
                            tabItem(text: title,
                                    index: index,
                                    action: {
                                        withAnimation {
                                            index == 0 ?
                                                proxy.scrollTo(index, anchor: .top) :
                                                proxy.scrollTo(index, anchor: .bottom)
                                        }
                                    })
                                    .fixedSize()
                        })
                    }
                    .frame(height: configuration.height)
                    .readSize(onChange: { size in
                        if size.width < geometry.size.width {
                            let leftoverWidth = geometry.size.width - size.width
                            let additionalPadding = leftoverWidth / CGFloat(2 * pages.count)
                            if UIDevice.current.userInterfaceIdiom == .pad, pages.count < configuration.stretchingLimit {
                                return
                            }

                            self.innerPadding += additionalPadding
                        } else {
                            isScrolling = true
                        }
                    })
                    .onChange(of: selectedTab) { index in
                        withAnimation {
                            index == 0 ?
                                proxy.scrollTo(index, anchor: .top) :
                                proxy.scrollTo(index, anchor: .bottom)
                        }
                    }
                }
            }
            .onAppear(perform: {
                UIScrollView.appearance().bounces = isScrolling || configuration.style == .sticky
            })
            .onDisappear(perform: {
                UIScrollView.appearance().bounces = true
            })
        }
    }

    func tabItem(text: String,
                 index: Int,
                 action: @escaping () -> Void) -> some View {
        Button {
            self.selectedTab = index
            action()
        } label: {
            label(text: text, index: index)
        }
        .background(configuration.tabBackgroundColor)
        .id(index)
        .buttonStyle(.plain)
    }

    @ViewBuilder
    private func label(text: String, index: Int) -> some View {
        VStack(spacing: 0) {
            Text(text)
                .lineLimit(1)
                .font(font(index))
                .foregroundColor(foregroundColor(index))
                .frame(height: configuration.height - configuration.underlineHeight)
                .frame(minWidth: configuration.minWidth)
                .padding(.horizontal, innerPadding)
                .animation(.none, value: selectedTab)
            if self.selectedTab == index {
                configuration.indicatorColor.frame(height: configuration.underlineHeight)
                    .cornerRadius(configuration.hasRoundedIndicator ? configuration.underlineHeight : 0)
                    .matchedGeometryEffect(id: "underline",
                                           in: namespace, properties: .frame)
            } else {
                Color.clear.frame(height: configuration.underlineHeight)
            }
        }
        .animation(.spring(), value: selectedTab)
    }

    private var divider: some View {
        configuration.dividerColor
            .frame(height: Sizes.dividerHeight)
            .padding(.horizontal, 0)
            .padding(.top, configuration.height)
    }

    private var shadow: some View {
        LinearGradient(
            colors: [configuration.shadowColor, .clear],
            startPoint: .top,
            endPoint: .bottom
        )
        .frame(height: Sizes.shadowHeight)
        .opacity(Sizes.shadowOpacity)
        .padding(.top, configuration.height)
    }

    private func font(_ index: Int) -> Font {
        selectedTab == index ? configuration.selectedTabFont : configuration.tabFont
    }

    private func foregroundColor(_ index: Int) -> Color {
        selectedTab == index ? configuration.selectedTabForegroundColor : configuration.tabForegroundColor
    }
}

struct SwipeableTab_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            let views: [SwipeableTab.TabPage] = [
                    .init(view: Text("Tab 1").eraseToAnyView(), title: "Tab 1"),
                    .init(view: Text("Tab 1").eraseToAnyView(), title: "Tab 1"),
                    .init(view: Text("Tab 1").eraseToAnyView(), title: "Tab 1"),
                    .init(view: Text("Tab 1").eraseToAnyView(), title: "Tab 1"),
                    .init(view: Text("Tab 1").eraseToAnyView(), title: "Tab 1")
            ]
            SwipeableTab(pages: views,
                         configuration: .init(style: .flat))
            .navigationTitle("Navigation")
        }
    }
}
