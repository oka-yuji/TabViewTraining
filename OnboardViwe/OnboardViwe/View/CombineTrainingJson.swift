//
//  CombineTrainingJson.swift
//  OnboardViwe
//
//  Created by 岡優志 on 2021/06/29.
//

import SwiftUI
import Combine

struct CombineTrainingJson: View {
    @EnvironmentObject var webModel2: WebModel2
    var body: some View {
         VStack {
            Text("テキスト受信サンプル2")
               .padding()
            Text("\(webModel2.outText)")
               .background(Color.yellow)
               .padding()
            Text("「***時間切れ***」を表示する場合は日本標準時サーバーが停止しています\n「- - - - - - - -」を表示したままの場合は再度実行してください")
               .padding()
         }
         .onAppear {
            // 表示と同時にスタート
            self.webModel2.fetch()
         }
      }
    }
struct CombineTrainingJson_Previews: PreviewProvider {
    static var previews: some View {
        CombineTrainingJson()
            .environmentObject(WebModel2())
    }
}


//Combine
class WebModel2: ObservableObject {
    @Published var itemData: [Item] = []
    @Published var query = "swift"
    
@Published var outText: String = "- - - - - - - -"
 private var cancellableNetwork: AnyCancellable? = nil
 let session = URLSession(configuration: .default)

func fetch() {
    guard let url = URL(string: "https://api.github.com/search/repositories?q=\(query)") else { return print("URL Error") }

     cancellableNetwork = session
        .dataTaskPublisher(for: url)
        .timeout(3.0, scheduler: DispatchQueue.main) {
            self.outText = "Time Out!!"
            return URLError(.timedOut)
        }
        .tryMap { element in
           guard let httpResponse = element.response as? HTTPURLResponse,
              httpResponse.statusCode == 200 else {
                 throw URLError(.badServerResponse)
           }
           return element.data
     }
     .print()
     .decode(type: Repositories.self, decoder: JSONDecoder())
     .receive(on: DispatchQueue.main)
     .sink(receiveCompletion: { print (" ==Received completion: \($0).")
     }) { item in
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        self.outText = item.items[0].fullName ?? "error"
        
     }
  }
}



//guard let jsonData = data else { return print("Json Error") }
//
//do {
//    let decoder = JSONDecoder()
//    decoder.keyDecodingStrategy = .convertFromSnakeCase
//    let repositories = try decoder.decode(Repositories.self, from: jsonData)
//    DispatchQueue.main.async {
//        completion(repositories.items)
//    }
