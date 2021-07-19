//
//  ContentView.swift
//  Slot Machine
//
//  Created by TI Digital on 19/07/21.
//

import SwiftUI

struct ContentView: View {
 
    let symbols = ["gfx-bell","gfx-cherry","gfx-coin","gfx-grape","gfx-seven","gfx-strawberry"]
    @State private var highscore: Int = 0
    @State private var coins: Int = 100
    @State private var betAmount: Int = 10
    
    @State private var reels: Array = [0,1,2]
    @State private var showingInfoView: Bool = false
    
    // MARK: - FUNCTIONS
    func spinReels(){
//        reels[0] = Int.random(in: 0...symbols.count - 1)
//        reels[1] = Int.random(in: 0...symbols.count - 1)
//        reels[2] = Int.random(in: 0...symbols.count - 1)
        reels = reels.map({ _ in
            Int.random(in: 0...symbols.count - 1)
        })
    }
    //spin the reels
    
    func checkWinning() {
        if reels[0] == reels[1] && reels[1] == reels[2] && reels[0] == reels[2]{
            if coins>highscore{
                newHighScore()
            }
        }
        else
        {
            playerLoses()
        }
    }
    //check the winning
    
    func playerWins(){
        coins += betAmount*10
    }
    
    //player wins
    
    func newHighScore() {
        highscore = coins
    }

    //new highscore
    func playerLoses(){
        coins -= betAmount
    }
    //player loses
    // game is over
    
    // MARK : - Body
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
                        
                        Text("\(coins)")
                            .scoreNumberStyle()
                            .modifier(ScoreNumberModifier())
                    }
                    .modifier(ScoreContainerModifier())
                    Spacer()
                    HStack{
                        Text("\(highscore)")
                            .scoreNumberStyle()
                            .modifier(ScoreNumberModifier())
                        
                        Text("High\nScore".uppercased())
                            .scoreLabelStyle()
                            .multilineTextAlignment(.leading)
                    }
                    .modifier(ScoreContainerModifier())
                }
                // MARK : - Slot Machine
                
                VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 0){
                    //MARK : - Reel#1
                    ZStack {
                        ReelView()
                        Image(symbols[reels[0]])
                            .resizable()
                            .modifier(ImageModifier())
                    }
                    
                    //MARK : - Reel#2
                    HStack(alignment: .center, spacing: 0){
                        ZStack {
                            ReelView()
                            Image(symbols[reels[1]])
                                .resizable()
                                .modifier(ImageModifier())
                        }
                        Spacer()
                        //MARK : - Reel#3
                        ZStack {
                            ReelView()
                            Image(symbols[reels[2]])
                                .resizable()
                                .modifier(ImageModifier())
                        }
                    }
                    .frame(maxWidth: 500)
                   
                    //MARK : - SPIN BUTTON
                    Button(action: {
                        self.spinReels()
                        
                        self.checkWinning()
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
                    self.showingInfoView = true
                }) {
                    Image(systemName: "info.circle")
                }
                .modifier(ButtonModifier()),alignment: .topTrailing
            )
            .padding()
            .frame(maxWidth: 720)
        }
        .sheet(isPresented: $showingInfoView){
            InfoView()
               
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
