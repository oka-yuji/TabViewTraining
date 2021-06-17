//
//  SearchGithubUserView.swift
//  OnboardViwe
//
//  Created by 岡優志 on 2021/06/12.
//

import SwiftUI

struct SearchGithubUserView: View {
    @ObservedObject var searchData: SearchUser
    var body: some View {
        NavigationView {
            VStack(spacing: 0.0){
                CustomSearchBarView()
                    .environmentObject(searchData)
                
                List(searchData.seawrchedRepository, id: \.nodeId) { user in
                    NavigationLink (
                        destination: UserRipositoryView(fetchFullName: user.fullName ?? "", fetchLanguageURL: user.language ?? "", fetchStarsURL: "\(user.stargazersCount ?? 0)", fetchWatchURL: "\(user.watchersCount ?? 0)", fetchForksURL: "\(user.forksCount ?? 0)", fetchIssuesURL: "\(user.openIssuesCount ?? 0)", fetchAvatarURL: user.owner.avatarUrl ?? "")
                            .ignoresSafeArea(edges: .bottom))
                    {
                        Text(user.fullName ?? "")
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


