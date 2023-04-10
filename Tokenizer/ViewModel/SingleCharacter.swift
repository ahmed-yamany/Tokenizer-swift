//
//  SingleCharacter.swift
//  Tokenizer
//
//  Created by Ahmed Yamany on 10/04/2023.
//

import Foundation

let SINGLE_CHARACTER_TOKENS = [
    "+" : "PLUS",
    "-" : "MINUS",
    "*" : "MULT",
    "/" : "DEVIATION",
    "(" : "RIGHTPAREN",
    ")" : "LEFTPAREN",
    "." : "DOT",
    "," : "COMA",
    " " : "SPACE",
    "=" : "EQUAL",
    "\n" : "NEWLINE"
]

struct SingleCharacter {
    
    static func isSingleCharToken(char: String) -> Bool {
        return SINGLE_CHARACTER_TOKENS.keys.contains(char)
    }
    
    static func getSingleCharToken(char: Character) -> String{
        return SINGLE_CHARACTER_TOKENS[String(char)]!
    }
    
}
