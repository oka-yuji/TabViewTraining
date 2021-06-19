//
//  SearchViewModel.swift
//  OnboardViwe
//
//  Created by 岡優志 on 2021/06/18.
//

import Foundation

class SearchViewModel: ObservableObject {
    let fetcher = FetchUserRepositoriesFormatter()
    
    @Published var itemData: [Item] = []
    @Published var query2 = ""
    
    func fetchRepository() {
        itemData.removeAll()
        self.fetcher.fetchUserRepository(query: query2) { (items) in
        
            self.itemData.append(contentsOf: items)
            print(self.itemData.count)
            
        }
    }
    
//    init() {
//        self.fetcher.fetchUserRepository(query: "swift") { (items) in
//               self.itemData = items
//           }
//       }
    
}
