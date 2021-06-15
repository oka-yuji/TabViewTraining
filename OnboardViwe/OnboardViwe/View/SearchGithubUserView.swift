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
        NavigationView{
            VStack(spacing: 0.0){
                CustomSearchBarView()
                    .environmentObject(searchData)
                
            List(searchData.seawrchedUser, id: \.node_id) { user in
                NavigationLink (
                    destination: UserRipositoryView(fetchLangageURL: user.events_url, fetchStarsURL: user.starred_url, fetchWatchURL: user.following_url, fetchForksURL: user.gists_url, fetchIssuesURL: user.login, fetchAvatarURL: user.avatar_url)
                        .ignoresSafeArea(edges: .bottom))
                    {
                    Text(user.login)
                    }
                    .onAppear {
                        if user.node_id == searchData.seawrchedUser.last?.node_id {
//                            searchData.find()
                        }
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


