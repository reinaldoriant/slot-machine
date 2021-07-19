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
                
                VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 0){
                    //MARK : - Reel#1
                    ZStack {
                        ReelView()
                        Image("gfx-bell")
                            .resizable()
                            .modifier(ImageModifier())
                    }
                    
                    //MARK : - Reel#2
                    HStack(alignment: .center, spacing: 0){
                        ZStack {
                            ReelView()
                            Image("gfx-seven")
                                .resizable()
                                .modifier(ImageModifier())
                        }
                        Spacer()
                        //MARK : - Reel#3
                        ZStack {
                            ReelView()
                            Image("gfx-cherry")
                                .resizable()
                                .modifier(ImageModifier())
                        }
                    }
                    .frame(maxWidth: 500)
                   
                    //MARK : - SPIN BUTTON
                    Button(action: {
                        print("Spin the reels")
                    }){
                        Image("gfx-spin")
                            .renderingMode(.original)
                            .resizable()
                            .modifier(ImageModifier())
                    }
                }
                .layoutPriority(2)
                //MARK : - Footer
                Spacer()
                HStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 10){
                    //MARK : - Bet 20
                    Button(action: {
                        print("Bet 20 coins")
                    }) {
                        Text("20")
                            .fontWeight(.heavy)
                            .foregroundColor(Color.white)
                            .modifier(BetNumberModifier())
                    }
                    .modifier(BetCapsulModifier())
                    
                    Image("gfx-casino-chips")
                        .resizable()
                        .opacity(0)
                        .modifier(CasinoChipsModifier())
                    
                    //MARK : - Bet 10
                    Image("gfx-casino-chips")
                        .resizable()
                        .opacity(1)
                        .modifier(CasinoChipsModifier())
                    
                    Button(action: {
                        print("Bet 10 coins")
                    }) {
                        Text("10")
                            .fontWeight(.heavy)
                            .foregroundColor(Color.yellow)
                            .modifier(BetNumberModifier())
                    }
                    .modifier(BetCapsulModifier())
                    
                    
                }
                
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
