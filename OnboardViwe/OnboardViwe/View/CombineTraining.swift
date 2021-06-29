//
//  CombineTraining.swift
//  OnboardViwe
//
//  Created by 岡優志 on 2021/06/29.
//

import SwiftUI
import Combine

struct CombineTraining: View {
    @EnvironmentObject var webModel: WebModel
    var body: some View {
        VStack{
            self.webModel.dlImage != nil ? Image(uiImage: self.webModel.dlImage!).resizable()
                : Image(systemName: "house")
        }
        .aspectRatio(contentMode: .fit)
        .frame(width: 300, height: 300)
        .onAppear(perform: {
            self.webModel.fetch()
        })
    }
}

struct CombineTraining_Previews: PreviewProvider {
    static var previews: some View {
        CombineTraining()
            .environmentObject(WebModel())
    }
}


class WebModel: ObservableObject {
    @Published var dlImage: UIImage?
    private var cancellableNetwork: AnyCancellable? = nil
    let session = URLSession.shared
    
    /// 画像の受信
    func fetch() {
        let url = URL(string: "https://illustimage.com/photo/6845.png")!
        
        cancellableNetwork = session
            .dataTaskPublisher(for: url)
            .map { data, URLResponse in UIImage(data: data) }
            .receive(on: DispatchQueue.main)
            .replaceError(with: nil)
            .assign(to: \.dlImage, on: self)
    }
}
