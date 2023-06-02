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
    @State private var isFinish = false
    @State private var winOrLose = ""
    @State private var isHidden = true
    
    private let maxPlay = 3
    @State private var score = 0
    @State private var userPlayed = 0
    
    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    Text("Score: \(score)")
                        .font(.title2)
                    Spacer()
                }
                
                HStack() {
                    // user
                    VStack {
                        Text("User Hand")
                            .font(.largeTitle.bold())
                        
                        HStack {
                            ForEach(userHands, id:\.self) { hand in
                                Button {
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
                            if userPlayed == maxPlay {
                                isFinish = true
                                winOrLose = "Finish"
                            }
                        }
                    } message: {
                        Text("You choose: \(userChoosed.capitalized) \n Enemy Choose: \(userHands[computerHandIndex].capitalized)")
                    }
                    .alert(winOrLose, isPresented: $isFinish) {
                        Button("Restart") {
                            restart()
                        }
                    } message: {
                        Text("Your Final Score is \(score)")
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
        
    }
    
    func handTapped() {
        let computerChoosed = userHands[computerHandIndex]
        
        isHidden = false
        userPlayed += 1
        
        if userChoosed == "rock" && computerChoosed == "scissors" || userChoosed == "paper" && computerChoosed == "rock" || userChoosed == "scissors" && computerChoosed == "paper"{
            winOrLose = "Win"
            score += 1
        } else if userChoosed == "rock" && computerChoosed == "paper" || userChoosed == "paper" && computerChoosed == "scissors" || userChoosed == "scissors" && computerChoosed == "rock"{
            winOrLose = "Lose"
            if score > 0 {
                score -= 1
            }
        } else {
            winOrLose = "Draw"
        }
        
        isTapped = true
    }
    
    func restart() {
        score = 0
        userPlayed = 0
        computerHandIndex = Int.random(in: 0...2)
        isHidden = true
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
