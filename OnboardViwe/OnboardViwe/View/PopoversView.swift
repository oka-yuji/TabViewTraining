//
//  PopoversView.swift
//  OnboardViwe
//
//  Created by 岡優志 on 2021/07/16.
//

import SwiftUI

struct PopoversView: View {
    @State var isPopoverPresented = false
    var body: some View {
        Button(action: {
            isPopoverPresented = true
        }, label: {
            Text("Button")
        })
        .popover(isPresented: $isPopoverPresented, content: {
            OnboardView()
        })
    }
}

struct PopoversView_Previews: PreviewProvider {
    static var previews: some View {
        PopoversView()
    }
}
