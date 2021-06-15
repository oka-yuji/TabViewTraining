//
//  UserRipositoryView.swift
//  OnboardViwe
//
//  Created by 岡優志 on 2021/06/13.
//

import SwiftUI

struct UserRipositoryView: View {
    @State var image: UIImage?
    let fetchLangageURL: String
    let fetchStarsURL: String
    let fetchWatchURL: String
    let fetchForksURL: String
    let fetchIssuesURL: String
    let fetchAvatarURL: String
    var body: some View {
        VStack{
            if let image = image {
                Image(uiImage: image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: UIScreen.main.bounds.height * 0.5)
                    .clipShape(Circle())
            }
            VStack(spacing: 10.0) {
                Text("title")
                    .font(.title)
                VStack(alignment: .trailing, spacing: 10.0){
                    HStack{
                        Text(fetchLangageURL)
                        Spacer()
                        Text(fetchStarsURL)
                    }
                    Text(fetchWatchURL)
                    Text(fetchForksURL)
                    Text(fetchIssuesURL)
                }
            }
            .padding()
            Spacer()
        }
        .onAppear {
            let url = fetchAvatarURL
            downloadImageAsync(url: URL(string: url)!) { image in
                self.image = image
            }
        }
    }
}

struct UserRipositoryView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            UserRipositoryView(fetchLangageURL: "language", fetchStarsURL: "stars", fetchWatchURL: "watch", fetchForksURL: "forks", fetchIssuesURL: "issues", fetchAvatarURL: "https://illustimage.com/photo/6845.png")
        }
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
