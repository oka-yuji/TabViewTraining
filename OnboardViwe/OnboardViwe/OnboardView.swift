//
//  OnboardView.swift
//  OnboardViwe
//
//  Created by 岡優志 on 2021/06/08.
//

import SwiftUI

struct OnboardView: View {
    @State var num = 1
       var body: some View {
           VStack{
               TabView(selection: $num){
                   ForEach(1...3, id: \.self) { index in
                       VStack{
                       Image("\(index)")
                           .resizable()
                           .aspectRatio(contentMode: .fit)
                           .frame(width: 400, height: 200)
                           Text("ここには\(index)Page目のImageが表示されます")
                       }
                       .tag(index)
                   }
               }
               .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
               Spacer()
               HStack{
                   Circle()
                       .foregroundColor(num == 1 ? .gray.opacity(0.3) : .black)
                       .frame(width: 10, height: 10)
                   Circle()
                       .foregroundColor(num == 2 ? .gray.opacity(0.3) : .black)
                       .frame(width: 10, height: 10)
                   Circle()
                       .foregroundColor(num == 3 ? .gray.opacity(0.3) : .black)
                       .frame(width: 10, height: 10)
               }
           }
       }
}

struct OnboardView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardView()
    }
}
