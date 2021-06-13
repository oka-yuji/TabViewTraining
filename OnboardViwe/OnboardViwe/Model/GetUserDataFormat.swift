//
//  GetUserDataFormat.swift
//  OnboardViwe
//
//  Created by 岡優志 on 2021/06/13.
//

import Foundation
class GetUserDataFormat: ObservableObject{
    @Published var userData: [UserStore] = []
    
    func getUserData(query: String ) {
        guard let url = URL(string: "https://api.github.com/search/users?q=\(query)") else {
            return print("URL Error")
        }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else { return }
            let decoder: JSONDecoder = JSONDecoder()
            do {
                let user: UserStore = try decoder.decode(UserStore.self, from: data)
                DispatchQueue.main.async {
                }
                print(user)
            } catch {
                print(error)
            }
        }
        .resume()
    }
}
