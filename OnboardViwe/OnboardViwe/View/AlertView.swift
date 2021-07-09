//
//  AlertView.swift
//  OnboardViwe
//
//  Created by 岡優志 on 2021/07/09.
//

import SwiftUI

struct AlertView: View {
    @State var isAlert = false
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(Color.gray.opacity(0.5))
                .edgesIgnoringSafeArea(.all)
            VStack {
                VStack {
                Text("Title")
                    .bold()
                Text("test")
                    .font(.subheadline)
                }
                Divider()
                Button(action: {
                    isAlert = false
                }, label: {
                    Text("OK!")
                })
            }
            .padding(.vertical, 30)
            .frame(width: 250)
            .background(Color.white.opacity(0.8))
            .cornerRadius(25)
        }
    }
}

struct AlertView_Previews: PreviewProvider {
    static var previews: some View {
        SearchGithubUserView()
            .environmentObject(SearchViewModel(fetchUser: FetchUserRepository()))
    }
}
