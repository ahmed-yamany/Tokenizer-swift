//
//  Tokenizer.swift
//  Tokenizer
//
//  Created by Ahmed Yamany on 10/04/2023.
//

import Foundation


let multiTokenSpecifications = [
    ("INTEGER", "\\d+"),
    ("ID", "[a-zA-Z_][a-zA-Z0-9_]*")
]


class Tokenizer {
    let text: String
    
    private var currentCharIndex: Int = 0
    private var currentLexeme: String = ""
    public var tokens: [Token] = []
    
    init(text: String) {
        
        self.text = text
        
    }
    
    func tokenize() {
        
        while self.currentCharIndex <= self.text.count - 1 {
            
            if SingleCharacter.isSingleCharToken(char: String(self.currentChar())){
          
                self.makeSingleCharToken()
                self.makeMultiCharacter()
                
            } else {
                
                self.currentLexeme += String(self.currentChar())
                
            }
            
            self.currentCharIndex += 1
            
        }
        
        self.makeMultiCharacter()
        
        tokens = tokens.sorted { $0.index < $1.index}
    }

    
    private func currentChar() -> Character {
        
        let index = self.text.index(at: self.currentCharIndex)
        return self.text[index]
        
    }
    
    // MARK: - makeSingleCharToken
    private func makeSingleCharToken() {
        
        let token = Token(index: self.currentCharIndex + 1,
                          type: SingleCharacter.getSingleCharToken(char: self.currentChar()),
                          value: String(self.currentChar()))

        self.tokens.append(token)
    
    }
    
    // MARK: - makeMultiCharacter
    private func isPredectiedToken(string: String, pattern: String) -> Bool{
        
        let predict = NSPredicate(format:"SELF MATCHES %@", pattern)
        return predict.evaluate(with: string)
        
    }

    private func getMultiCharToken() -> String?{
        
        for i in multiTokenSpecifications {
            
            if isPredectiedToken(string: self.currentLexeme, pattern: i.1) {
                return i.0
            }
            
        }
        
        return nil
    }
    
    private func makeMultiCharacter() {
        guard let multiChar = self.getMultiCharToken() else { return }
        
        let token = Token(index: self.currentCharIndex, type: multiChar, value: self.currentLexeme)
        
        self.currentLexeme = ""
        
        self.tokens.append(token)
    }
    
}



