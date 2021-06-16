//
//  SearchUser.swift
//  OnboardViwe
//
//  Created by 岡優志 on 2021/06/13.
//

import SwiftUI

class SearchUser: ObservableObject {
    @Published var seawrchedRepository: [Repository] = []
    @Published var query = ""
    
    func find() {
        seawrchedRepository.removeAll()
        guard let url:URL = URL(string: "https://api.github.com/search/repositories?q=\(query)") else { return }
        let session = URLSession(configuration: .default)
        session.dataTask(with: url) { (data, _, error) in
            guard let jsonData = data else { return }
            do {
                let decoder = JSONDecoder()
                    decoder.keyDecodingStrategy = .convertFromSnakeCase
                let repositories = try decoder.decode(Meta.self, from: jsonData)
               
                                DispatchQueue.main.async {
                                    self.seawrchedRepository.append(contentsOf: repositories.items)
                                }
                print("seikou")
            } catch {
                print("error1")
            }
        }
        .resume()
    }
}
