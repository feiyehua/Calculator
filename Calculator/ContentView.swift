//
/*******************************************************************************
 
 File name:     ContentView.swift
 Author:        FeiYehua
 
 Description:   Created for Calculator in 2024
 
 History:
 2024/10/5: File created.
 
 ********************************************************************************/

import SwiftUI
import PartialSheet
struct ContentView: View {
    var body: some View {
        GeometryReader{geometry in
            TabView{
                CalculatorView()
                    .tabItem{
                        Label("Calculator",systemImage: "x.squareroot")
                    }
                GraphView()
                    .attachPartialSheetToRoot()
                    .tabItem{
                        Label("Graph",systemImage: "chart.xyaxis.line")
                    }
                    //.frame(height: 0.9 * geometry.size.height)
                HistoryView()
                    .tabItem{
                        Label("History",systemImage: "list.clipboard")
                    }
            }
        }
    }
}


#Preview {
    ContentView()
}
