//
//  MultiCharacter.swift
//  Tokenizer
//
//  Created by Ahmed Yamany on 14/04/2023.
//

import Foundation

// Array of tuples that define the possible multi-character tokens
let multiTokenSpecifications = [
    ("INTEGER", "\\d+"),
    ("FLOAT", "^-?\\d*\\.?\\d+(e-?\\d+)?$"),
    ("ID", "[a-zA-Z_][a-zA-Z0-9_]*")
]

struct MultiCharacter {
    // Get the token type for a given multi-character lexeme
    static func getMultiCharToken(from lexeme: String) -> String? {
        
        for i in multiTokenSpecifications {
            
            // Check if the lexeme matches one of the token patterns
            if isPredectiedToken(string: lexeme, pattern: i.1) {
                return i.0 // Return the token type if there is a match
            }
            
        }
        return nil // Return nil if there is no match
    }
    
    // Create a multi-character token from a given lexeme and index
    static func makeMultiCharToken(lexem: String, start: Int, end: Int) -> Token? {
        
        if let type = getMultiCharToken(from: lexem) {
            return Token(start: start, end: end, type: type, value: lexem)
        }
        return nil
    }
    
    // Check if a given string matches a given regular expression pattern
    static func isPredectiedToken(string: String, pattern: String) -> Bool{
        let predict = NSPredicate(format:"SELF MATCHES %@", pattern)
        return predict.evaluate(with: string)
    }
    
}
