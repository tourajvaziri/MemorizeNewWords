//
//  MemorizeWordsListView.swift
//  MemorizeNewWords
//
//  Created by touraj vaziri on 2020-03-09.
//  Copyright © 2020 Touraj. All rights reserved.
//

import SwiftUI

struct MemorizeWordsListView: View {
    
    var selectedWordsToMemorize = [Word]()
    
    var body: some View {
        VStack(alignment: .leading)
        {
            // Text("Selected \(selectedRows.count) words")
            List(selectedWordsToMemorize) { word in
                HStack {
                    
                    Text(word.spanishWord)
                        .frame(width: 140, alignment: .leading)
                    
                    Spacer()
                    
                    
                    Image(systemName: "equal.circle")
                    Spacer()
                    
                    Text(word.translatedWorld)
                        .frame(width: 150, alignment: .leading)
                    
                }
            }
        }
    }
}

struct MemorizeWordsListView_Previews: PreviewProvider {
    static var previews: some View {
        MemorizeWordsListView()
    }
}
