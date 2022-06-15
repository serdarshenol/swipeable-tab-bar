//
//  ContentView.swift
//  swipeabletabbar
//
//  Created by Serdar Senol on 15/06/2022.
//

import SwiftUI

struct ContentView: View {
    let views: [SwipeableTab.TabPage] =
        [
            .init(view: SampleView(backgroundColor: .gray).eraseToAnyView(), title: "Tab 1"),
            .init(view: SampleView(backgroundColor: .blue).eraseToAnyView(), title: "Tab 2"),
            .init(view: SampleView(backgroundColor: .yellow).eraseToAnyView(), title: "Tab 3"),
            .init(view: SampleView(backgroundColor: .green).eraseToAnyView(), title: "Tab 4"),
            .init(view: SampleView(backgroundColor: .white).eraseToAnyView(), title: "Tab 5")
        ]
    
    var body: some View {
        SwipeableTab(pages: views,
                     configuration: .init(style: .flat))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
