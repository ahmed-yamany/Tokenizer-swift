//
//  ContentView.swift
//  Tokenizer
//
//  Created by Ahmed Yamany on 10/04/2023.
//

import SwiftUI

struct TokeizerView: View {
    @State var text: String = ""
    @State var isOn: Bool = false
    @State var tokens: [Token] = []
    
    @State var error = ""
    
    var body: some View {
        VStack(spacing: 30.0) {
            
            
            TextField("Enter a source code to tokenize it", text: $text)
                .textInputAutocapitalization(.never)
                .disableAutocorrection(true)
            
            
            VStack {
                
                HStack {
                    Text("Token")
                    Spacer()
                    Text("Token Type")
                    Spacer()
                    Text("Position")
                }
                
                ScrollView(.vertical, showsIndicators: false) {
                    VStack(spacing: 20.0) {
                        
                        ForEach(tokens) { token in
                            if isOn {
                                if token.value != " "{
                                    HStack {
                                        Text(token.value)
                                        Spacer()
                                        Text(token.type)
                                        Spacer()
                                        Text("\(token.end)")
                                    }
                                    Divider()
                                }
                            }
                            else {
                                HStack {
                                    Text(token.value)
                                    Spacer()
                                    Text(token.type)
                                    Spacer()
                                    Text("\(token.end)")
                                }
                                Divider()

                            }
                        }
                    }
                }
            }
            
            Spacer()
            
            if error != "" {
                Text(error)
            }
            Button {
                if text != "" {
                    let tokenizer = Tokenizer(text: text)
                    tokenizer.tokenize()
                    tokens = tokenizer.tokens
                    
                    error = tokenizer.sysntaxError
                }
            } label: {
                Text("Tokenize")
                    .frame(width: 200, height: 44)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
                    .shadow(radius: 0.5, x: 1, y: 1)
                    .shadow(color: Color(uiColor: .label), radius: 4)
            }
            
        }
        .padding(30)
    }
        
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        TokeizerView()
    }
}
