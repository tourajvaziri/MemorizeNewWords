//
//  AddNewWordView.swift
//  LearnWords
//
//  Created by touraj vaziri on 2020-03-05.
//  Copyright © 2020 Touraj. All rights reserved.
//

import SwiftUI

struct AddNewWordView: View {
    
    @Binding var newSpanishWord: String
    @Binding var newTranslatedWord: String
    @Binding var modelData: [Word]
    @State private var addNewWordEnabled: Bool = false
    
    var body: some View {
        
        VStack(alignment: .center, spacing: 30)
        {
            Text("Add A New Word").bold().foregroundColor(.black)
            HStack(alignment: .center, spacing: 10)
            {
                TextField("New Word", text: $newSpanishWord)
                
                Image(systemName: "equal.circle")
                    .aspectRatio(1, contentMode: .fit)
                
                TextField("Translated Word", text: $newTranslatedWord)
            }
            .padding(.all,10)
            .padding([.leading,.trailing],30)
            .background(Color.white.opacity(0.5))
            .cornerRadius(20)
            
            
            
            Button(action: {
                self.modelData.append(Word(spanishWord: self.newSpanishWord, translatedWorld: self.newTranslatedWord, isSelected: true))
                self.newSpanishWord = ""
                self.newTranslatedWord = ""
                
            }) {
                Image(systemName: "plus.circle")
                    .padding(.all,5)
                    .background(Color.white.opacity(0.5))
                    .cornerRadius(20)
            }
            .scaleEffect(2)
            .disabled(newSpanishWord.isEmpty || newTranslatedWord.isEmpty)
        }
    }
}

struct AddNewWordView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack
            {
                Rectangle()
                    .foregroundColor(Color.green)
                    .edgesIgnoringSafeArea(.all)
                AddNewWordView(newSpanishWord: Binding.constant(""), newTranslatedWord: Binding.constant(""), modelData: Binding.constant([]))
        }
    }
}
