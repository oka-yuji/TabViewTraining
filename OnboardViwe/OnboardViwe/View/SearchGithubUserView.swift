//
//  SearchGithubUserView.swift
//  OnboardViwe
//
//  Created by 岡優志 on 2021/06/12.
//

import SwiftUI

struct SearchGithubUserView: View {
    @State var user = GetUserDataFormat()
    var body: some View {
        NavigationView{
            List{
                
            }
            .navigationTitle("GitHub")
        }.ignoresSafeArea()
    }
}

struct SearchGithubUserView_Previews: PreviewProvider {
    static var previews: some View {
        SearchGithubUserView()
    }
}


