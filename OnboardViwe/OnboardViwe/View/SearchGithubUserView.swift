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
            VStack{
                CustomSearchBarView(searchUser: SearchUser())
            List{
                
            }
            .navigationTitle("GitHub")
            .navigationBarTitleDisplayMode(.inline)
        }
            Spacer()
        }
    }
}

struct SearchGithubUserView_Previews: PreviewProvider {
    static var previews: some View {
        SearchGithubUserView()
    }
}


