//
//  Modifier.swift
//  Slot Machine
//
//  Created by TI Digital on 19/07/21.
//

import SwiftUI

struct ShadowModifier: ViewModifier{
    func body(content: Content) -> some View {
        content
            .shadow(color: Color("ColorTransparentBlack"), radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: 6)
    }
}
struct ButtonModifier: ViewModifier{
    func body(content: Content) -> some View {
        content
            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            .accentColor(Color.white)
    }
}
struct ScoreNumberModifier: ViewModifier{
    func body(content: Content) -> some View {
        content
            .shadow(color: Color("ColorTransparentBlack"), radius: 0, x: 0, y: 3)
            .layoutPriority(1)
    }
}
struct ScoreContainerModifier: ViewModifier{
    func body(content: Content) -> some View {
        content
            .padding(.vertical,4)
            .padding(.horizontal,16)
            .frame(minWidth: 128)
            .background(Capsule()
                            .foregroundColor(Color("ColorTransparentBlack")))
    }
}
