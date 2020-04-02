//
//  ContentView.swift
//  vstackSample
//
//  Created by miguel tomairo on 4/1/20.
//  Copyright © 2020 rapser. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State private var countries = ["Peru","Bolivia","Argentina","Brazil","Chile","Colombia","Ecuador","Paraguay","Uruguay","Venezuela"].shuffled()
    
    @State private var correctAnswer = Int.random(in: 0...2)
    @State private var score = 0
    @State private var alertTitlte = ""
    @State private var showingAlert = false
    
    var body: some View {

        NavigationView{
            VStack{
                ForEach(0...2, id: \.self) { number in
                    Image(self.countries[number])
                        .border(Color.black, width: 1)
                        .onTapGesture {
                            self.flagTapped(number)
                    }
                }
            }.navigationBarTitle(Text(countries[correctAnswer].uppercased()))
                .alert(isPresented: $showingAlert) { () -> Alert in
                    Alert(title: Text(alertTitlte), message: Text("Tu puntuacion es \(score)"), dismissButton: .default(Text("Continuar")){
                        self.askQuestion()
                        })
            }
        }

    }
    
    func flagTapped(_ tag: Int) {
        if tag == correctAnswer {
            self.score += 1
            alertTitlte = "correcto"
        }else {
            self.score -= 1
            alertTitlte = "incorrecto"
        }
        
        showingAlert = true
    }
    
    func askQuestion(){
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
