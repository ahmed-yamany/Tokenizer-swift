//
//  Token.swift
//  Tokenizer
//
//  Created by Ahmed Yamany on 10/04/2023.
//

import Foundation


struct Token: Identifiable {
    var id = UUID()
    
    let index: Int
    let type: String
    let value: String
}

