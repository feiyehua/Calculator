//
/*******************************************************************************
 
 File name:     ButtonOfCalculator.swift
 Author:        FeiYehua
 
 Description:   Created for Calculator in 2024
 
 History:
 2024/10/16: File created.
 
 ********************************************************************************/


import Foundation
import SwiftUI
struct CalculatorButton: View {
    var displayedCharacter: String  // 按钮对应的字符
    var addToStringCharacter: String
    @Binding var toBeCalculatedString: String  // 绑定到外部字符串的状态
    var backgroundColor: Color  // 自定义背景颜色
    var foregroundColor: Color  // 自定义前景颜色
    @State var isTapped=false
    var body: some View {
        ZStack{
            let calcButton=Circle()
                .fill(backgroundColor)
                .onTapGesture {
                    toBeCalculatedString.append(addToStringCharacter)  // 按下按钮时添加字符
                    isTapped = !isTapped;
                }
            if #available(iOS 17, *) {
                    // 只在 iOS 17 及以上版本调用 .sensoryFeedback API
                calcButton.sensoryFeedback(.impact, trigger: isTapped)
                }
                //.sensoryFeedback(.impact, trigger: isTapped)
            Text("\(displayedCharacter)")
                .font(.title)
                .lineLimit(1)
                .padding()
                .foregroundColor(foregroundColor)
                .minimumScaleFactor(0.1)
        }
    }
}
struct CalculatorButtonAC: View {
    @Binding var toBeCalculatedString: String
    @Binding var lastExpression:String
    @State var isTapped=false
    var body: some View {
        ZStack{
            let calcButton=Circle()
                .fill(.black)
                .onTapGesture {
                    toBeCalculatedString=""
                    isTapped = !isTapped
                    lastExpression=""
                }
            if #available(iOS 17, *) {
                    // 只在 iOS 17 及以上版本调用 .sensoryFeedback API
                calcButton.sensoryFeedback(.success, trigger: isTapped)
                }
            Text("AC")
                .font(.title)
                .bold()
                .padding()
                .foregroundColor(.red)
        }
    }
}
struct CalculatorButtonEqual: View {
    @Binding var toBeCalculatedString: String
    @Binding var lastExpression:String
    @State var isTapped=false
    var body: some View {
        ZStack{
            let calcButton=Circle()
                .fill(.black)
                .onTapGesture {
                    isTapped = !isTapped
                    let cxxString=std.string(toBeCalculatedString)
                    var cxxResultString=std.string("")
                    getStringValue(cxxString,&cxxResultString)
                    lastExpression=toBeCalculatedString
                    lastExpression.append("=")
                    toBeCalculatedString=String(cxxResultString)
                    saveToFile(content: lastExpression+toBeCalculatedString+"\n")
                }
            if #available(iOS 17, *) {
                    // 只在 iOS 17 及以上版本调用 .sensoryFeedback API
                calcButton.sensoryFeedback(.success, trigger: isTapped)
                }
            Text("=")
                .font(.title)
                .bold()
                .padding()
                .foregroundColor(.yellow)
        }
    }
}
