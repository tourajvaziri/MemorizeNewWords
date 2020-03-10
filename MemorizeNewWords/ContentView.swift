//
//  ContentView.swift
//  LearnWords
//
//  Created by touraj vaziri on 2020-02-10.
//  Copyright © 2020 Touraj. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State private var selectedRows = Set<Word>()
    
    @State private var modelData: [Word] =
        [ Word(spanishWord: "CASA", translatedWorld: "HOME", isSelected: false),
          Word(spanishWord: "CAasdassadsadasdasdasdadasdS", translatedWorld: "HOMasdasdasd", isSelected: false)]
    
    @State private var newSpanishWord: String = ""
    @State private var newTranslatedWord: String = ""
    
    var body: some View {
        
        NavigationView {
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
                            
                            ZStack
                                {
                                    VStack(alignment: .leading)
                                    {
                                        Text("Selected \(selectedRows.count) words")
                                        List(modelData, selection: $selectedRows) { pet in
                                            MultiSelectRow(pet: pet, selectedItems: self.$selectedRows)
                                        }
                                    }
                                    
                            }
                            .navigationBarTitle(Text("Selected \(selectedRows.count) words"), displayMode: .inline)
                            
                        }
                        .padding(.top, -20.0)
                        
                        NavigationLink(destination: MemorizeWordsListView(selectedWordsToMemorize: Array(selectedRows)))
                        {
                            Text("START PRACTICING SELECTED WORDS").bold().foregroundColor(.black)
                                .foregroundColor(.black)
                                
                                .padding(.all,5)
                                
                                .background(Color.white.opacity(0.5))
                                .cornerRadius(20)
                        }
                        .disabled(selectedRows.count <= 0)
                        
                    }
                    .padding(.vertical)
            }
                // .edgesIgnoringSafeArea(.all)
                .navigationBarTitle(Text("Memorize Words Main Page"), displayMode: .inline)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        //var sasda:Int = 2
        ContentView()
    }
}
