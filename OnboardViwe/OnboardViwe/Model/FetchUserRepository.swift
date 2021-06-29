//
//  FetchUserRepositoriesFormatter.swift
//  OnboardViwe
//
//  Created by 岡優志 on 2021/06/18.
//

import Foundation
import Combine

protocol Fetcher {
    func fetchUserRepository(query: String, completion: @escaping ([Item]) -> Void)
}
class FetchUserRepository: Fetcher {
    func fetchUserRepository(query: String, completion: @escaping ([Item]) -> Void) {
        guard let url: URL = URL(string: "https://api.github.com/search/repositories?q=\(query)") else { return print("URL Error") }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let jsonData = data else { return print("Json Error") }
            
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let repositories = try decoder.decode(Repositories.self, from: jsonData)
                DispatchQueue.main.async {
                    completion(repositories.items)
                }
            } catch {
                print("items Decoder Error")
            }
        }
        .resume()
    }
    
    //Combine
    
    @Published var outText: String = "- - - - - - - -"
     private var cancellableNetwork: AnyCancellable? = nil
     let session = URLSession(configuration: .default)
    
    func fetch() {
         let url = URL(string: "https://ntp-b1.nict.go.jp/cgi-bin/json")!

         cancellableNetwork = session
            .dataTaskPublisher(for: url)
            .timeout(3.0, scheduler: DispatchQueue.main, options: nil, customError: {
               self.outText = "***時間切れ***"
               return URLError(.timedOut)})
            .tryMap { element in
               guard let httpResponse = element.response as? HTTPURLResponse,
                  httpResponse.statusCode == 200 else {
                     throw URLError(.badServerResponse)
               }
               return element.data
         }
         .print()
         .map { String(data:$0, encoding:.utf8) }
         .receive(on: DispatchQueue.main)
         .sink(receiveCompletion: { print (" ==Received completion: \($0).") },
              receiveValue: {
               self.outText = $0 ?? "*** NO DATA ***"
               print(" **Received data: \(self.outText)")
         })
      }
    
    
}

