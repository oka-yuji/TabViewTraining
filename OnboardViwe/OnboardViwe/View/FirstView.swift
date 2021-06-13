//
//  FirstView.swift
//  OnboardViwe
//
//  Created by 岡優志 on 2021/06/08.
//

import SwiftUI

struct FirstView: View {
    var body: some View {
        Rectangle()
            .edgesIgnoringSafeArea(.all)
            .foregroundColor(.pink)
    }
}

struct FirstView_Previews: PreviewProvider {
    static var previews: some View {
        FirstView()
    }
}
