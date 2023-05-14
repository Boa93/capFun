//
//  ContentView.swift
//  TextEdit
//
//  Created by Boa on 14/05/2023.
//

import SwiftUI

struct ContentView: View {
    @State var userText = ""
    @State var capMod = 1
    
    var body: some View {
        
        VStack {
            Spacer()
            if capMod == 1 {
                Text(userText.uppercased())
                    .font(.title)
            }else if capMod == 2 {
                Text(userText.capitalized)
                    .font(.title)
            }else {
                Text(userText.lowercased())
                    .font(.title)
            }
            
            TextField("Enter Text here....", text: $userText)
                .padding()
            
            HStack {
                Button(action: {
                    capMod =  1
                }){
                    ButtonRounded(buttonName: "CAPS", buttonColor: .blue)
                }
                
                Button(action: {
                    capMod = 2
                }) {
                    ButtonRounded(buttonName: "First Letter", buttonColor: .red)
                }
                
                Button(action: {
                    capMod = 3
                }) {
                    ButtonRounded(buttonName: "lowercase", buttonColor: .green)
                }
                
                            }
            Spacer()
            Button(action: {
                if capMod == 1 {
                    UIPasteboard.general.string = userText.uppercased()
                }else if capMod == 2 {
                    UIPasteboard.general.string = userText.capitalized
                }else {
                    UIPasteboard.general.string = userText.lowercased()
                }
                
            }){
                ButtonRounded(buttonName: "copy text", buttonColor: .gray)
            }
            
            
        }.padding()
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct ButtonRounded: View {
    var buttonName: String
    var buttonColor: Color
    
    var body: some View {
        
            Text(buttonName)
                .padding(8)
                .frame(maxWidth: .infinity)
                .foregroundColor(.white)
                .font(.title3)
                .background(buttonColor)
                .cornerRadius(10)
        }
        
    }

