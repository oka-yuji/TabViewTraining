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
// dataTaskPublisher(for:)はURLSessionクラスのCombine用メソッド
            .dataTaskPublisher(for: url)
// mapはデータを変換するCombineのオペレーターです。 UIImage?型を返します。
            .map { data, URLResponse in UIImage(data: data) }
// 以降のCombineオペレーターは変換されたデータ（だけ）を受け取ります。
// データを受け取りをDispatchQueue.mainに指定しています。
            .receive(on: DispatchQueue.main)
// エラーがあった場合には次へ渡すデータを引数で指定したnil（値なし）に置き換えています。
            .replaceError(with: nil)
// cancellableNetwork には最後の.assign(to: \.dlImage, on: self)が返す値が入ります。
// 受け取ったデータ（mapでUIImageインスタンスに変換済み）をdlImageプロパティにセットします。
            .assign(to: \.dlImage, on: self)
    }
}
