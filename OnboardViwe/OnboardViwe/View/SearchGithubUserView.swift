//
//  SearchGithubUserView.swift
//  OnboardViwe
//
//  Created by 岡優志 on 2021/06/12.
//

import SwiftUI

struct SearchGithubUserView: View {
    //    @State var user = GetUserDataFormat()
    @ObservedObject var searchData: SearchUser
    
    var body: some View {
        NavigationView {
            VStack(spacing: 0.0){
                CustomSearchBarView()
                    .environmentObject(searchData)
                
                List(searchData.seawrchedUser, id: \.node_id) { user in
                    NavigationLink (
                        destination: UserRipositoryView(fetchLangageURL: user.name, fetchStarsURL: user.name, fetchWatchURL: user.name, fetchForksURL: user.name, fetchIssuesURL: user.name, fetchAvatarURL: user.name)
                            .ignoresSafeArea(edges: .bottom))
                    {
                        Text(user.full_name)
                    }
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
        SearchGithubUserView(searchData: SearchUser())
    }
}


