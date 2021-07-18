//
//  ContentView.swift
//  Slot Machine
//
//  Created by TI Digital on 19/07/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            //MARK : - Background
            LinearGradient(gradient: Gradient(colors: [Color("ColorPink"), Color("ColorPurple")]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            //MARK : - Interface
            VStack (alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 5){
                
                //MARK : - Header
                LogoView()
                Spacer()
                //MARK : - Score
                //MARK : - Slot Machine
                //MARK : - Footer
            }
            //MARK : - Buttons
            .overlay(
                Button(action: {
                    print("Reset the game")
                }) {
                    Image(systemName: "arrow.2.circlepath.circle")
                }
                .modifier(ButtonModifier()),alignment: .topLeading
            )
            .overlay(
                Button(action: {
                    print("Reset the game")
                }) {
                    Image(systemName: "info.circle")
                }
                .modifier(ButtonModifier()),alignment: .topTrailing
            )
            .padding()
            .frame(maxWidth: 720)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
