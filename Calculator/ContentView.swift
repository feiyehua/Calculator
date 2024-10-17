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
    @State private var toBeCalculatedString = ""  // 用于存储字符串
    @State private var isDeleteTapped=false
    
    var body: some View {
        GeometryReader{geometry in
            VStack {
                //GeometryReader{ geometry in
                HStack {
                    Text(toBeCalculatedString)  // 显示当前字符串
                        .font(.largeTitle)
                        .lineLimit(1)
                    //.padding()
                        .frame(width: 300)
                        .minimumScaleFactor(0.1)
                    Button(action: {
                        if !toBeCalculatedString.isEmpty
                        {
                            toBeCalculatedString.removeLast()
                            isDeleteTapped = !isDeleteTapped
                        }
                    }) {
                        Image(systemName: "delete.left")  // 使用系统垃圾桶图标
                            .font(.title)
                            .foregroundColor(.red)
                        //.padding()
                    }
                    .sensoryFeedback(.impact, trigger: isDeleteTapped)
                    //}
                }
                .frame(height: geometry.size.height / 8)
                TabView {
                    VStack{
                        MainButtons(toBeCalculatedString:$toBeCalculatedString)
                    }
                    VStack{
                        ExpandedButtons(toBeCalculatedString:$toBeCalculatedString)
                    }
                }
                .frame(height: geometry.size.height*7 / 8)
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
            }
        }
        .padding()
    }
    
}


#Preview {
    ContentView()
}
