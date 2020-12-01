//
//  ContentView.swift
//  KeyboardShortCutSUI
//
//  Created by Steven Lipton on 11/26/20.
//
// An exercise file for iOS Development Tips Weekly
// A weekly course on LinkedIn Learning for iOS developers
//  Season 13 (Q1 2021) video 12
//  by Steven Lipton (C)2020, All rights reserved
// Learn more at https://linkedin-learning.pxf.io/YxZgj
//This Week:  Lear how to use keybord shortcuts in SwiftUI
//  For more code, go to http://bit.ly/AppPieGithub

import SwiftUI

struct ButtonLabelView:View{
    var systemName:String
    var captionLabel:String
    var body: some View{
        VStack {
            Image(systemName: systemName)
                .resizable()
                .scaledToFit()
                .accentColor(.black)
            Text(captionLabel)
                .font(.body)
                .foregroundColor(.black)
        }
    }
}

struct CellView:View{
    @Binding var index:Int
    var body: some View{
        VStack {
            Image(systemName: "\(index).circle.fill")
                .resizable()
                .scaledToFit()
                .foregroundColor(Color("Color\(index % 5)"))
        }
    }
}

struct ContentView: View {
    @State var count:Int = 0
    @State var columnCount:Int = 3
    let gradient = Gradient(colors: [Color("Color5"),Color("Color6")])
    var columns:[GridItem]{
        Array(repeating: GridItem(spacing:5), count: (columnCount % 10) + 1)
    }
    var body: some View {
        VStack {
            Text("Keyboard ShortCut Demo")
                .font(.largeTitle)
                .fontWeight(.heavy)
                .padding()
            //----------------------Buttons-------------------------
            HStack{
                Button(action:{count = (count >= 50 ? 50 : count + 1)}){
                    ButtonLabelView(
                        systemName: "plus.circle",
                        captionLabel: "Add ⌘ A"
                    )
                }
                
                Spacer()
                Button(action: {count = (count > 0 ? count - 1 : 0)}){
                    ButtonLabelView(
                        systemName: "minus.circle",
                        captionLabel: "Delete ⌘ ⌫"
                    )
                }
                
                
                Spacer()
                Button(action: {columnCount += 1 }){
                    ButtonLabelView(
                        systemName: "circle.grid.3x3.fill",
                        captionLabel: "Columns ⌥⇧ ⇥"
                    )
                }
                
            }
            .frame(height:100)
            .padding(20)
            ScrollView{
                VStack{
                    Spacer()
                    LazyVGrid(columns: columns, spacing: 10){
                        ForEach (0...count,id:\.self){ item in
                            CellView(index:.constant(item))
                    }
                }
                
                }.padding()
                
            }
            Spacer()
        }
        .background(LinearGradient(gradient: gradient, startPoint: .top, endPoint: .bottomTrailing))
        .cornerRadius(40)
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
