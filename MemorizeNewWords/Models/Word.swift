//
//  Word.swift
//  LearnWords
//
//  Created by touraj vaziri on 2020-03-06.
//  Copyright © 2020 Touraj. All rights reserved.
//

import Foundation

struct Word: Identifiable, Hashable {
    var id = UUID()
    var spanishWord: String
    var translatedWorld: String
    var isSelected: Bool
}
