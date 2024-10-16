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
        /*Button(action: {
            toBeCalculatedString.append(addToStringCharacter)  // 按下按钮时添加字符
            isTapped = !isTapped;
        }) {
            Text("\(displayedCharacter)")  // 按钮显示
                .font(.title)
                .padding()
                .background(backgroundColor)
                .foregroundColor(foregroundColor)
                .cornerRadius(10)
            
        }
        .sensoryFeedback(.impact, trigger: isTapped)*/
        ZStack{
            Circle()
                .fill(backgroundColor)
                .onTapGesture {
                    toBeCalculatedString.append(addToStringCharacter)  // 按下按钮时添加字符
                    isTapped = !isTapped;
                }
                .sensoryFeedback(.impact, trigger: isTapped)
            Text("\(displayedCharacter)")
                .font(.title)
                .padding()
                .foregroundColor(foregroundColor)
        }
    }
}
