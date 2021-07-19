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
                HStack {
                    HStack{
                        Text("Your\nCoins".uppercased())
                            .scoreLabelStyle()
                            .multilineTextAlignment(.trailing)
                        
                        Text("100")
                            .scoreNumberStyle()
                            .modifier(ScoreNumberModifier())
                    }
                    .modifier(ScoreContainerModifier())
                    Spacer()
                    HStack{
                        Text("200")
                            .scoreNumberStyle()
                            .modifier(ScoreNumberModifier())
                        
                        Text("High\nScore".uppercased())
                            .scoreLabelStyle()
                            .multilineTextAlignment(.leading)
                    }
                    .modifier(ScoreContainerModifier())
                }
                //MARK : - Slot Machine
                
                
                //MARK : - Footer
                Spacer()
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
