//
//  Test.swift
//  OnboardViwe
//
//  Created by 岡優志 on 2021/06/15.
//

import SwiftUI

struct Test: View {
    @State var inputText = ""
    @State var outputText = ""
    var body: some View {
        VStack {
            HStack{
                Image(systemName: "magnifyingglass")
                    .font(.title2)
                TextField("input", text: $inputText, onCommit: {
                    outputText = inputText
                    inputText = ""
                })
            }
            .frame(height: 30)
            .padding(5)
            .background(Color.gray.opacity(0.2))
            .cornerRadius(15)
            .padding(10)
            
            
            
        Text("Name is\(outputText)")
        }
    }
}

struct Test_Previews: PreviewProvider {
    static var previews: some View {
        Test()
    }
}
