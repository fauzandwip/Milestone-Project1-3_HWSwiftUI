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
    private var computerHand = Int.random(in: 0..<3)
    
    @State private var userChoosed = "rock"
    
    var body: some View {
        NavigationStack {
            HStack(spacing: 100) {
                // user hand
                VStack {
                    Text("User Hand")
                        .font(.largeTitle.bold())
                    
                    HStack {
                        ForEach(userHands, id:\.self) { hand in
                            Button {
                            } label: {
                                Image(hand)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(maxWidth: 200, maxHeight: 200)
                            }
                        }
                    }
                }
                
                VStack {
                    Text("Enemy")
                        .font(.largeTitle.bold())
                    
                    // computer hand
                    Button {
                        
                    }label: {
                        Image(computerHands[computerHand])
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(maxWidth: 200, maxHeight: 200)
                    }
                }
            }
            .padding()
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
