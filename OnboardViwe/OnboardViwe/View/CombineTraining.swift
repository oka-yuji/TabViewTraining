//
//  CombineTraining.swift
//  OnboardViwe
//
//  Created by 岡優志 on 2021/06/29.
//

import SwiftUI
import Combine

struct CombineTraining: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct CombineTraining_Previews: PreviewProvider {
    static var previews: some View {
        CombineTraining()
    }
}


class WebModel: ObservableObject {
  @Published var dlImage: UIImage?
  private var cancellableNetwork: AnyCancellable? = nil
  let session = URLSession.shared

  /// 画像の受信
  func fetch() {
     let url = URL(string: "https://upload.wikimedia.org/wikipedia/commons/1/1a/Yukichi_Fukuzawa_1891.jpg")!

     cancellableNetwork = session
        .dataTaskPublisher(for: url)
        .map { data, URLResponse in UIImage(data: data) }
        .receive(on: DispatchQueue.main)
        .replaceError(with: nil)
        .assign(to: \.dlImage, on: self)
  }
}
