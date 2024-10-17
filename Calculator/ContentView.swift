//
/*******************************************************************************
 
 File name:     ContentView.swift
 Author:        FeiYehua
 
 Description:   Created for Calculator in 2024
 
 History:
 2024/10/5: File created.
 
 ********************************************************************************/

import SwiftUI
//import CxxStdlib
//struct buttomOfCalculator
struct ContentView: View {
    var body: some View {
        TabView{
            CalculatorView()
                .tabItem{
                    Label("Calculator",systemImage: "x.squareroot")
                }
            ChartView()
                .tabItem{
                    Label("Chart",systemImage: "chart.xyaxis.line")
                }
            HistoryView()
                .tabItem{
                    Label("History",systemImage: "clock.arrow.trianglehead.counterclockwise.rotate.90")
                }
        }
    }
    
}


#Preview {
    ContentView()
}
