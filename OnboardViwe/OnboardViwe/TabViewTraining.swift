//
//  TabViewTraining.swift
//  OnboardViwe
//
//  Created by 岡優志 on 2021/06/08.
//

import SwiftUI

struct TabViewTraining: View {
    var body: some View {
        TabView{
            FirstView()
                .tabItem {
                    Label("firstView", systemImage: "note.text")
                                    }
            SecondView()
                .tabItem {
                    Image(systemName: "note.text")
                    Text("secondView")
                }
        }
    }
}

struct TabViewTraining_Previews: PreviewProvider {
    static var previews: some View {
        TabViewTraining()
    }
}
