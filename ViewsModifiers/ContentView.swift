//
//  ContentView.swift
//  ViewsModifiers
//
//  Created by Jiří Zenzinger on 12.02.2021.
//

import SwiftUI

struct ContentView: View {
    
    @State private var usedText = false
    
    var body: some View {
        Color.blue
            .frame(width: 300, height: 300)
            .watermarked(with: "You're fucked up")
    }
}
struct Watermark: ViewModifier {
    var text: String
    
    func body(content: Content) -> some View {
        ZStack(alignment: .bottomTrailing) {
            content
            Text(text)
                .font(.title)
                .foregroundColor(.white)
                .padding(5)
                .background(Color.gray)
                .cornerRadius(3.0)
                .opacity(0.8)
        }
    }
}

extension View {
    func watermarked(with text: String) -> some View {
        self.modifier(Watermark(text: text))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
            ContentView()
        
    }
}
