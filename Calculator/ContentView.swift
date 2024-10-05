//
    /*******************************************************************************
            
            File name:     ContentView.swift
            Author:        FeiYehua
            
            Description:   Created for Calculator in 2024
            
            History:
                    2024/10/5: File created.
            
    ********************************************************************************/
    

import SwiftUI
//struct buttomOfCalculator
struct ContentView: View {
    var body: some View {
        VStack {
            RoundedRectangle(cornerRadius:20)
                .fill(.white)
                .frame(width: 350, height: 100)
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(Color.black, lineWidth: 2)
                )
            HStack {
                Circle()
                    .fill(.blue)
            }
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
