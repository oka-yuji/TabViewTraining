//
//  UserRipositoryView.swift
//  OnboardViwe
//
//  Created by 岡優志 on 2021/06/13.
//

import SwiftUI

struct UserRipositoryView: View {
    @State var image: UIImage?
    var body: some View {
        VStack{
            if let image = image {
                Image(uiImage: image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: UIScreen.main.bounds.height * 0.5)
            }
            VStack(spacing: 10.0) {
                Text("title")
                    .font(.title)
                VStack(alignment: .trailing, spacing: 10.0){
                    HStack{
                        Text("language")
                        Spacer()
                        Text("stars")
                    }
                    Text("watch")
                    Text("forks")
                    Text("issues")
                }
            }
            .padding()
            Spacer()
        }
        .onAppear {
            let url = "https://illustimage.com/photo/6845.png"
            downloadImageAsync(url: URL(string: url)!) { image in
                self.image = image
            }
        }
    }
}

struct UserRipositoryView_Previews: PreviewProvider {
    static var previews: some View {
        UserRipositoryView()
    }
}


func downloadImageAsync(url: URL, completion: @escaping (UIImage?) -> Void) {
    let session = URLSession(configuration: .default)
    let task = session.dataTask(with: url) { (data, _, _) in
        var image: UIImage?
        if let imageData = data {
            image = UIImage(data: imageData)
        }
        DispatchQueue.main.async {
            completion(image)
        }
    }
    task.resume()
}
