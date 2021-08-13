//
//  SearchGithubUserView.swift
//  OnboardViwe
//
//  Created by 岡優志 on 2021/06/12.
//

import SwiftUI

struct SearchGithubUserView: View {
    @EnvironmentObject var searchViewModel: SearchViewModel
    let mockUserRipositoryData: [Item] = mockUserData
    @State var isFlag = false
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack(spacing: 0.0){
                    CustomSearchBarView()
                        .onTapGesture {
                            isFlag = true
                            
                        }
                    List(searchViewModel.itemData, id: \.nodeId) { item in
                        NavigationLink (
                            destination: UserRipositoryView(fetchFullName: item.fullName ?? "", fetchLanguageText: item.language ?? "", fetchStarsText: "\(item.stargazersCount ?? 0)", fetchWatchText: "\(item.watchersCount ?? 0)", fetchForksText: "\(item.forksCount ?? 0)", fetchIssuesText: "\(item.openIssuesCount ?? 0)", fetchAvatarURL: item.owner.avatarUrl ?? "")
                                .background(Color.white)
                                .ignoresSafeArea(edges: .bottom))
                        {
                            Text(item.fullName ?? "")
                        }
                    }
                    .navigationTitle("GitHub")
                }
//                AlertView()
//                    .edgesIgnoringSafeArea(.all)
            }
            Spacer()
        }
        
//        .alert(isPresented: $isFlag, content: {
//            Alert(title: Text("test"),
//                  message: Text("test"),
//                  dismissButton: .default(Text("OK!"),
//                                          action: { isFlag = false }))
//        })
    }
}

struct SearchGithubUserView_Previews: PreviewProvider {
    static var previews: some View {
        SearchGithubUserView()
            .environmentObject(SearchViewModel(fetchUser: FetchUserRepository()))
    }
}
