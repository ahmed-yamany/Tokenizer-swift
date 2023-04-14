//
//  SingleCharacter.swift
//  Tokenizer
//
//  Created by Ahmed Yamany on 10/04/2023.
//

import Foundation

// Dictionary that maps single-character lexemes to token types
let SINGLE_CHARACTER_TOKENS = [
    "+" : "PLUS",
    "-" : "MINUS",
    "*" : "MULT",
    "/" : "DEVIATION",
    "(" : "RIGHTPAREN",
    ")" : "LEFTPAREN",
    "=" : "EQUAL",
    "\n" : "NEWLINE"
]

struct SingleCharacter {
    
    // Checks if a given lexeme is a single-character token
    static func isSingleCharToken(from lexem: String) -> Bool {
        return SINGLE_CHARACTER_TOKENS.keys.contains(lexem)
    }
    
    // Get the token type for a given single-character lexeme
    static func getSingleCharToken(char: Character) -> String{
        return SINGLE_CHARACTER_TOKENS[String(char)]!
    }
    
    // Create a single-character token from a given lexeme and index
    static func makeSingleCharToken(from lexeme: String, start: Int, end: Int) -> Token? {
        
        // Check if the lexeme is a single-character token
        if isSingleCharToken(from: lexeme) {
            
            // Create a new Token object
            return Token(start: start, end: end,
                         type: SingleCharacter.getSingleCharToken(char: Character(lexeme)),
                         value: lexeme)
            
        }
        
        // If the lexeme is not a single-character token, return nil
        return nil
    }
}
