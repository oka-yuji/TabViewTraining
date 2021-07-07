//
//  SwiftUIViewTest.swift
//  OnboardViwe
//
//  Created by 岡優志 on 2021/07/03.
//

import SwiftUI

struct SwiftUIViewTest: View {
    @State var text = ""
    @State private var maxWidth = UIScreen.main.bounds.width
    var body: some View {
        ZStack {
            Image("githubImage")
                .resizable()
                .scaledToFit()
                .frame(width: 600, height: 600)
                .foregroundColor(.gray.opacity(0.8))
                
                .offset(x: maxWidth * 0.5, y: UIScreen.main.bounds.height * -0.2)
                
            VStack(alignment: .leading){
                HStack {
                    Text("GitHubSearcher")
                    .font(.system(size: 36))
                        .bold()
                }
                HStack{
                    Image(systemName: "magnifyingglass")
                        .font(.title2)
                        .foregroundColor(.white.opacity(0.8))
                    TextField("input text", text: $text)
                }
                .padding()
                    .frame(width: UIScreen.main.bounds.width * 0.9, height: 60)
                .background(Color.black)
                .clipShape(RoundedRectangle(cornerRadius: 25.0))
                .padding(.bottom, 20)
                Spacer()
                GeometryReader { geometry in
                    ScrollView {
                        ForEach (0..<10) { item in
                        ListView()
                        }
                    }
                }
                .frame(width: maxWidth * 0.9)
            }
        }
    }
}

struct SwiftUIViewTest_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIViewTest()
    }
}

struct ListView: View {
    @State private var maxWidth = UIScreen.main.bounds.width
    var body: some View {
        VStack{
            HStack{
                Image(systemName: "person.circle")
                    .resizable()
                    .frame(width: 50, height: 50)
                    .padding(.trailing, 20)
                VStack(alignment: .leading){
                    Text("fullName")
                        .font(.title2)
                    Text("language")
                }
                Spacer()
                Image(systemName: "arrow.right")
                    .font(.title)
            }
            .padding(20)
            .foregroundColor(.white)
            .frame(width: maxWidth * 0.9, height: 80)
            .background(Color.black)
            .clipShape(RoundedRectangle(cornerRadius: 25.0))
        }
    }
}
