//
//  Test.swift
//  OnboardViwe
//
//  Created by 岡優志 on 2021/06/19.
//

import SwiftUI

struct Test2: View {
    @EnvironmentObject var tekitou: Tekitou
    @State var tekiteki = ""
    var body: some View {
        TextField("test", text: $tekiteki, onCommit: {
            tekitou.tekitou = ""
            tekitou.tekitou = tekiteki
        })
    }
}

struct Test: View {
    @EnvironmentObject var tekitou: Tekitou
    @State var tekiteki = ""
    var body: some View {
        VStack{
            Test2()
        Text(tekitou.tekitou)
        }
    }
}

struct Test_Previews: PreviewProvider {
    static var previews: some View {
        Test()
            .environmentObject(Tekitou())
    }
}


class Tekitou: ObservableObject {
    @Published var tekitou = ""
}
