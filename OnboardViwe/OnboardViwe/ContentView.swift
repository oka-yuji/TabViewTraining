//
//  ContentView.swift
//  OnboardViwe
//
//  Created by 岡優志 on 2021/06/06.
//

import SwiftUI

struct ContentView: View {
   
    var body: some View {
        VStack {
//            SearchGithubUserView()
//            MockView()
//                .environmentObject(SearchViewModel(fetchUser: FetchUserRepository()))
            OnboardView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
