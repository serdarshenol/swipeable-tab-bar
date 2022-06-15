//
//  SampleView.swift
//  swipeabletabbar
//
//  Created by Serdar Senol on 15/06/2022.
//

import SwiftUI

public struct SampleView: View {
    let backgroundColor: Color
    
    public var body: some View {
        VStack {
            HStack {
                Text("Top Left")
                    .font(Font.system(size: 25, weight: .bold))
                Spacer()
                Text("Top Right")
                    .font(Font.system(size: 25, weight: .bold))
            }
            Spacer()
            HStack {
                Text("Bottom Left")
                    .font(Font.system(size: 25, weight: .bold))
                Spacer()
                Text("Bottom Right")
                    .font(Font.system(size: 25, weight: .bold))
            }
        }
        .background(backgroundColor)
    }
}

struct SampleView_Previews: PreviewProvider {
    static var previews: some View {
        SampleView(backgroundColor: .orange)
    }
}
