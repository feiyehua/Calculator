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
    
    var body: some View {
        VStack {
            HStack {
                Text(toBeCalculatedString)  // 显示当前字符串
                    .font(.largeTitle)
                    .padding()
                Button(action: {
                    if !toBeCalculatedString.isEmpty
                    {
                        toBeCalculatedString.removeLast()
                    }
                }) {
                    Image(systemName: "delete.left")  // 使用系统垃圾桶图标
                        .font(.title)
                        .foregroundColor(.red)
                        .padding()
                }
            }
            // 添加删除按钮
            HStack {
                Button(action: {
                    toBeCalculatedString=""
                }
                ) {
                    Text("AC")  // 按钮显示
                        .font(.title)
                        .padding()
                        .background(.black)
                        .foregroundColor(.red)
                        .cornerRadius(10)
                }
                CalculatorButton(
                    displayedCharacter: "(", addToStringCharacter: "(",
                    toBeCalculatedString: $toBeCalculatedString,backgroundColor: .blue,foregroundColor: .white)
                CalculatorButton(
                    displayedCharacter: ")", addToStringCharacter: ")",
                    toBeCalculatedString: $toBeCalculatedString,backgroundColor: .blue,foregroundColor: .white)
                CalculatorButton(
                    displayedCharacter: "÷", addToStringCharacter: "/",
                    toBeCalculatedString: $toBeCalculatedString,backgroundColor: .black,foregroundColor: .white)
            }
            HStack {
                CalculatorButton(
                    displayedCharacter: "7", addToStringCharacter: "7",
                    toBeCalculatedString: $toBeCalculatedString,backgroundColor: .blue,foregroundColor: .white)
                CalculatorButton(
                    displayedCharacter: "8", addToStringCharacter: "8",
                    toBeCalculatedString: $toBeCalculatedString,backgroundColor: .blue,foregroundColor: .white)
                CalculatorButton(
                    displayedCharacter: "9", addToStringCharacter: "9",
                    toBeCalculatedString: $toBeCalculatedString,backgroundColor: .blue,foregroundColor: .white)
                CalculatorButton(
                    displayedCharacter: "×", addToStringCharacter: "*",
                    toBeCalculatedString: $toBeCalculatedString,backgroundColor: .black,foregroundColor: .white)
            }
            HStack {
                CalculatorButton(
                    displayedCharacter: "4", addToStringCharacter: "4",
                    toBeCalculatedString: $toBeCalculatedString,backgroundColor: .blue,foregroundColor: .white)
                CalculatorButton(
                    displayedCharacter: "5", addToStringCharacter: "5",
                    toBeCalculatedString: $toBeCalculatedString,backgroundColor: .blue,foregroundColor: .white)
                CalculatorButton(
                    displayedCharacter: "6", addToStringCharacter: "6",
                    toBeCalculatedString: $toBeCalculatedString,backgroundColor: .blue,foregroundColor: .white)
                CalculatorButton(
                    displayedCharacter: "−", addToStringCharacter: "-",
                    toBeCalculatedString: $toBeCalculatedString,backgroundColor: .black,foregroundColor: .white)
            }
            HStack {
                CalculatorButton(
                    displayedCharacter: "1", addToStringCharacter: "1",
                    toBeCalculatedString: $toBeCalculatedString,backgroundColor: .blue,foregroundColor: .white)
                CalculatorButton(
                    displayedCharacter: "2", addToStringCharacter: "2",
                    toBeCalculatedString: $toBeCalculatedString,backgroundColor: .blue,foregroundColor: .white)
                CalculatorButton(
                    displayedCharacter: "3", addToStringCharacter: "3",
                    toBeCalculatedString: $toBeCalculatedString,backgroundColor: .blue,foregroundColor: .white)
                CalculatorButton(
                    displayedCharacter: "+", addToStringCharacter: "+",
                    toBeCalculatedString: $toBeCalculatedString,backgroundColor: .black,foregroundColor: .white)
            }
            HStack {
                CalculatorButton(
                    displayedCharacter: "0", addToStringCharacter: "0",
                    toBeCalculatedString: $toBeCalculatedString,backgroundColor: .blue,foregroundColor: .white)
                CalculatorButton(
                    displayedCharacter: ".", addToStringCharacter: ".",
                    toBeCalculatedString: $toBeCalculatedString,backgroundColor: .blue,foregroundColor: .white)
                Button(action: {
                    let cxxString=std.string(toBeCalculatedString)
                    var cxxResultString=std.string("")
                    getStringValue(cxxString,&cxxResultString)
                    toBeCalculatedString=String(cxxResultString)
                }
                ) {
                    Text("=")  // 按钮显示
                        .font(.title)
                        .padding()
                        .background(.black)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
