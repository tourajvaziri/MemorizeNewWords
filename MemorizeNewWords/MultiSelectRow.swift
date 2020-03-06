//
//  MultiSelectRow.swift
//  LearnWords
//
//  Created by touraj vaziri on 2020-03-06.
//  Copyright © 2020 Touraj. All rights reserved.
//

import SwiftUI

struct MultiSelectRow : View {
    
    var pet: Word
    @Binding var selectedItems: Set<UUID>
    var isSelected: Bool {
        selectedItems.contains(pet.id)
    }
    
    var body: some View {
        HStack {
            
            Text(self.pet.spanishWord)
                .frame(width: 140, alignment: .leading)
            
            Spacer()
            
            
            Image(systemName: "equal.circle")
            Spacer()
            
            Text(self.pet.translatedWorld)
                .frame(width: 150, alignment: .leading)
            
            
            //            Text(self.pet.spanishWord)
            //                .font(.title)
            //                .fontWeight(.bold)
            Spacer()
            if self.isSelected {
                Image(systemName: "checkmark")
                    .foregroundColor(Color.blue)
            }
        }
        .onTapGesture  {
            if self.isSelected {
                self.selectedItems.remove(self.pet.id)
            } else {
                self.selectedItems.insert(self.pet.id)
            }
        }
    }
}
