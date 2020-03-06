//
//  ContentView.swift
//  LearnWords
//
//  Created by touraj vaziri on 2020-02-10.
//  Copyright © 2020 Touraj. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State private var modelData: [Word] =
        [ Word(spanishWord: "CASA", translatedWorld: "HOME", isSelected: false),
          Word(spanishWord: "CAasdassadsadasdasdasdadasdS", translatedWorld: "HOMasdasdasd", isSelected: false)]
    
    @State private var newSpanishWord: String = ""
    @State private var newTranslatedWord: String = ""
    
    @State var selectedRows = Set<UUID>()
    
    var body: some View {
        
        ZStack
            {
                // Background
                Rectangle()
                    .foregroundColor(Color.green)
                    .edgesIgnoringSafeArea(.all)
                
                Rectangle()
                    .foregroundColor(Color.yellow)
                    .rotationEffect(Angle(degrees: 45))
                    .edgesIgnoringSafeArea(.all)
                
                VStack(alignment: .center, spacing: 30) {
                    VStack() {
                        AddNewWordView(newSpanishWord: $newSpanishWord, newTranslatedWord: $newTranslatedWord, modelData: $modelData)
                    }
                    
                    Text("Words List").bold().foregroundColor(.black)
                    
                    NavigationView {
                        List(modelData, selection: $selectedRows) { pet in
                            MultiSelectRow(pet: pet, selectedItems: self.$selectedRows)
                        }
                        .navigationBarTitle(Text("Selected \(selectedRows.count) words"))
                    } .padding(.top, -20.0)
                    
                    
                    Button(action: {
                        // Code
                        
                        NavigationLink(destination:  AddNewWordView(newSpanishWord: self.$newSpanishWord, newTranslatedWord: self.$newTranslatedWord, modelData: self.$modelData)) {
                            Text("Do Something")
                            
                        }
                    }) {
                        Text("Start Practicing").bold().foregroundColor(.black)
                    }
                        // .font(/*@START_MENU_TOKEN@*/.largeTitle/*@END_MENU_TOKEN@*/)
                        .padding(.all,5)
                        .background(Color.white.opacity(0.5))
                        .cornerRadius(20)
                        .scaleEffect(1.5)
                        .disabled(selectedRows.count <= 0)
                    
                }
                .padding(.vertical)
                
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        //var sasda:Int = 2
        ContentView()
    }
}
