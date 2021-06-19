//
//  FetchUserRepositoriesFormatter.swift
//  OnboardViwe
//
//  Created by 岡優志 on 2021/06/18.
//

import Foundation

class FetchUserRepositoriesFormatter {
    
func fetchUserRepository(query: String, completion: @escaping ([Item]) -> Void) {
//    seawrchedRepository.removeAll()
    guard let url: URL = URL(string: "https://api.github.com/search/repositories?q=\(query)") else { return }
    let session = URLSession(configuration: .default)
    session.dataTask(with: url) { (data, response, error) in
        guard let jsonData = data else { return }
        do {
            let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
            let repositories = try decoder.decode(Repositories.self, from: jsonData)
                            DispatchQueue.main.async {
                                completion(repositories.items)
                            }
        } catch {
            print("error1")
        }
    }
    .resume()
}

}

