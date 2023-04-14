//
//  Tokenizer.swift
//  Tokenizer
//
//  Created by Ahmed Yamany on 10/04/2023.
//

import Foundation

class Tokenizer {
    // Stores the input text string
    let text: String
    
    // An array of tokens that will be generated
    public var tokens: [Token] = [Token(start: -1, end: -1, type: "", value: "")]
    
    // A string to store any syntax errors that occur
    public var sysntaxError: String = ""
    
    // Constructor to initialize the text string
    init(text: String) { self.text = text }
    
    func tokenize() {
        
        // Get an array of lexemes by splitting the text at every space
        let lexemes = self.getTextLexemes()
        
        for index in 0...lexemes.count-1 {
            
            let lexem = lexemes[index]  // Get the current lexeme
            
            let start = tokens.last!.end
            let end = start + lexem.count + 1
            
            // Try to create a single-character token from the lexeme
            if let token = SingleCharacter.makeSingleCharToken(from: lexem, start: start, end: end) {
                
                self.tokens.append(token)
                
            // If a single-character token cannot be created, try to create a multi-character token
            } else if let token = MultiCharacter.makeMultiCharToken(lexem: lexem, start: start, end: end) {
                
                self.tokens.append(token)
            
            // If neither a single nor multi-character token can be created, there is a syntax error
            } else {
                
                // Store the error message and break out of the loop
                self.sysntaxError = "syntax error \(lexem) at position \(index) "
                break
                
            }
            
        }
        
        self.tokens.removeFirst()
        
    }
    
    // Helper method to split the text into lexemes
    private func getTextLexemes() -> [String] {
        return self.text.split(separator: " ").map { String($0) }
    }
    
}



