//
//  CustomSearchBarView.swift
//  OnboardViwe
//
//  Created by 岡優志 on 2021/06/13.
//

import SwiftUI

struct CustomSearchBarView: View {
    @ObservedObject var searchUser: SearchUser
    var body: some View {
        VStack{
            HStack{
                Image(systemName: "magnifyingglass")
                    .font(.title2)
                    .foregroundColor(.secondary)
                TextField("input user name", text: $searchUser.query)
            }
            .padding(.vertical, 10)
            .padding(.horizontal)
        }
        .background(Color.gray.opacity(0.2))
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .padding(.horizontal, 5)
        .padding(.top, 10)
      
    }
}

struct CustomSearchBarView_Previews: PreviewProvider {
    static var previews: some View {
        CustomSearchBarView(searchUser: SearchUser())
    }
}
