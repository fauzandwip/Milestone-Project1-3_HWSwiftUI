//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Fauzan Dwi Prasetyo on 02/06/23.
//

import SwiftUI

struct ContentView: View {
    private var userHands = ["rock", "paper", "scissors"]
    private var computerHands = ["rock_right", "paper_right", "scissors_right"]
    @State private var computerHandIndex = Int.random(in: 0...2)
    
    @State private var userChoosed = "rock"
    
    @State private var isTapped = false
    @State private var winOrLose = ""
    @State private var isHidden = true
    
    var body: some View {
        NavigationStack {
            HStack() {
                // user
                VStack {
                    Text("User Hand")
                        .font(.largeTitle.bold())
                    
                    HStack {
                        ForEach(userHands, id:\.self) { hand in
                            Button {
                                isHidden = false
                                userChoosed = hand
                                handTapped()
                            } label: {
                                Image(hand)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(maxWidth: 150, maxHeight: 150)
                            }
                        }
                    }
                }
                .alert(winOrLose, isPresented: $isTapped) {
                    Button("OK") {
                        computerHandIndex = Int.random(in: 0...2)
                        isHidden = true
                    }
                } message: {
                    Text("You choose: \(userChoosed.capitalized) \n Enemy Choose: \(userHands[computerHandIndex].capitalized)")
                }
                
                Spacer()
                
                // enemy
                VStack {
                    Text("Enemy")
                        .font(.largeTitle.bold())
                    
                    HStack {
                        Image(computerHands[computerHandIndex])
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(maxWidth: 150, maxHeight: 150)
                            .opacity(isHidden ? 0 : 1)
                    }
                }
            }
            .padding()
        }
        
    }
    
    func handTapped() {
        let computerChoosed = userHands[computerHandIndex]
        
        if userChoosed == "rock" && computerChoosed == "scissors" || userChoosed == "paper" && computerChoosed == "rock" || userChoosed == "scissors" && computerChoosed == "paper"{
            winOrLose = "Win"
        } else if userChoosed == "rock" && computerChoosed == "paper" || userChoosed == "paper" && computerChoosed == "scissors" || userChoosed == "scissors" && computerChoosed == "rock"{
            winOrLose = "Lose"
        } else {
            winOrLose = "Draw"
        }
        
        isTapped = true
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
