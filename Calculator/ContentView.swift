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
    @State private var isACTapped=false
    @State private var isDeleteTapped=false
    @State private var isEqualTapped=false
    @State private var is0Tapped=false
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
                // 添加AC按钮
                //GeometryReader{ geometry in
                HStack {
                    ZStack{
                        Circle()
                            .fill(.black)
                            .onTapGesture {
                                toBeCalculatedString=""
                                isACTapped = !isACTapped
                            }
                            .sensoryFeedback(.impact, trigger: isACTapped)
                        Text("AC")
                            .font(.title)
                            .bold()
                            .padding()
                            .foregroundColor(.red)
                    }
                    //.frame(width: geometry.size.width / 4)
                    CalculatorButton(
                        displayedCharacter: "(", addToStringCharacter: "(",
                        toBeCalculatedString: $toBeCalculatedString,backgroundColor: .blue,foregroundColor: .white)
                    //.frame(width: geometry.size.width / 4)
                    CalculatorButton(
                        displayedCharacter: ")", addToStringCharacter: ")",
                        toBeCalculatedString: $toBeCalculatedString,backgroundColor: .blue,foregroundColor: .white)
                    //.frame(width: geometry.size.width / 4)
                    CalculatorButton(
                        displayedCharacter: "÷", addToStringCharacter: "/",
                        toBeCalculatedString: $toBeCalculatedString,backgroundColor: .black,foregroundColor: .white)
                    //.frame(width: geometry.size.width / 4)
                    //}
                    
                }
                .frame(height: geometry.size.height / 6)
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
                .frame(height: geometry.size.height / 6)
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
                .frame(height: geometry.size.height / 6)
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
                .frame(height: geometry.size.height / 6)
                GeometryReader{ geometry1 in
                    HStack {
                        /*ZStack(){
                            Capsule()
                                .fill(.black)
                                .onTapGesture {
                                    toBeCalculatedString.append("0")
                                    is0Tapped = !is0Tapped
                                }
                                .frame(width: geometry1.size.width/2,height: geometry.size.height/8)
                                .sensoryFeedback(.impact, trigger: is0Tapped)
                            Text("0")
                                .font(.title)
                                .bold()
                                .padding()
                                .foregroundColor(.red)
                        }*/
                        CalculatorButton(
                         displayedCharacter: "0", addToStringCharacter: "0",
                         toBeCalculatedString: $toBeCalculatedString,backgroundColor: .blue,foregroundColor: .white)
                        CalculatorButton(
                         displayedCharacter: "00", addToStringCharacter: "00",
                         toBeCalculatedString: $toBeCalculatedString,backgroundColor: .blue,foregroundColor: .white)
                        CalculatorButton(
                            displayedCharacter: ".", addToStringCharacter: ".",
                            toBeCalculatedString: $toBeCalculatedString,backgroundColor: .blue,foregroundColor: .white)
                        ZStack{
                            Circle()
                                .fill(.black)
                                .onTapGesture {
                                    isEqualTapped = !isEqualTapped
                                    let cxxString=std.string(toBeCalculatedString)
                                    var cxxResultString=std.string("")
                                    getStringValue(cxxString,&cxxResultString)
                                    toBeCalculatedString=String(cxxResultString)
                                }
                                .sensoryFeedback(.success, trigger: isEqualTapped)
                            Text("=")
                                .font(.title)
                                .bold()
                                .padding()
                                .foregroundColor(.yellow)
                        }
                    }
                }
                .frame(height: geometry.size.height / 6)
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
