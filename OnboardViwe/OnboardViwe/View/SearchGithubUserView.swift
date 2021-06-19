//
//  SearchGithubUserView.swift
//  OnboardViwe
//
//  Created by 岡優志 on 2021/06/12.
//

import SwiftUI

struct SearchGithubUserView: View {
    @ObservedObject var searchViewModel: SearchViewModel
    var body: some View {
        NavigationView {
            VStack(spacing: 0.0){
                CustomSearchBarView()
                    .environmentObject(SearchViewModel())
                
                List(searchViewModel.itemData, id: \.nodeId) { user in
//                    List(searchData.seawrchedRepository, id: \.nodeId) { user in
                    NavigationLink (
                        destination: UserRipositoryView(fetchFullName: user.fullName ?? "", fetchLanguageText: user.language ?? "", fetchStarsText: "\(user.stargazersCount ?? 0)", fetchWatchText: "\(user.watchersCount ?? 0)", fetchForksText: "\(user.forksCount ?? 0)", fetchIssuesText: "\(user.openIssuesCount ?? 0)", fetchAvatarURL: user.owner.avatarUrl ?? "")
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
        SearchGithubUserView(searchViewModel: SearchViewModel())
    }
}


