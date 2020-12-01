//
//  SwiftUIView.swift
//  KeyboardShortCutSUI
//
//  Created by Steven Lipton on 11/26/20.
//

import SwiftUI

struct SwiftUIView: View {
    @State var count:Int = 0
    var body: some View {
        VStack{
            Image(systemName: "\(count).square.fill")
                .resizable()
                .scaledToFit()
                .padding()
            Button(action:{count += 1}){
                Text("Add One")
                    .font(.largeTitle)
                    .padding(20)
            }
            .keyboardShortcut(KeyEquivalent("a"))
            Button(action:{count -= 1}){
                Text("Subtract One")
                    .font(.largeTitle)
                    .padding(20)
            }
            .keyboardShortcut(KeyEquivalent.delete)
        }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView()
    }
}
