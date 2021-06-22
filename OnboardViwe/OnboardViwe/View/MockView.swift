//
//  MockView.swift
//  OnboardViwe
//
//  Created by 岡優志 on 2021/06/22.
//

import SwiftUI

struct MockView: View {
    @EnvironmentObject var searchViewModel: SearchViewModel
    let mockUserRipositoryData: [Item] = mockUserData
    
    var body: some View {
        NavigationView {
            VStack(spacing: 0.0){
                CustomSearchBarView()
                List(mockUserRipositoryData, id: \.nodeId) { item in
                    NavigationLink (
                        destination: UserRipositoryView(fetchFullName: item.fullName ?? "", fetchLanguageText: item.language ?? "", fetchStarsText: "\(item.stargazersCount ?? 0)", fetchWatchText: "\(item.watchersCount ?? 0)", fetchForksText: "\(item.forksCount ?? 0)", fetchIssuesText: "\(item.openIssuesCount ?? 0)", fetchAvatarURL: item.owner.avatarUrl ?? "")
                            .ignoresSafeArea(edges: .bottom))
                    {
                        Text(item.fullName ?? "")
                    }
                }
                .navigationTitle("GitHub")
                .navigationBarTitleDisplayMode(.inline)
            }
            Spacer()
        }
    }
}


struct MockView_Previews: PreviewProvider {
    static var previews: some View {
        MockView()
            .environmentObject(SearchViewModel(fetchUser: FetchUserRepository()))
    }
}
