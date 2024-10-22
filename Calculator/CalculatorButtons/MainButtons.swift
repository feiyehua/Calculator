//
    /*******************************************************************************
            
            File name:     MainButtons.swift
            Author:        FeiYehua
            
            Description:   Created for Calculator in 2024
            
            History:
                    2024/10/16: File created.
            
    ********************************************************************************/
    

import SwiftUI

struct MainButtons: View {
    //@Binding var toBeCalculatedString:String
    @Binding var lastExpression:String
    @Binding var buttonProfile:Bool
    @ObservedObject var toBeCalculatedExpression : ToBeCalculatedExpression
    var body: some View {
        HStack {
            CalculatorButtonAC(lastExpression:$lastExpression, toBeCalculatedExpression: toBeCalculatedExpression)
            CalculatorButton(
                displayedCharacter: "(", addToStringCharacter: "(",
                backgroundColor: .blue,foregroundColor: .white,toBeCalculatedExpression: toBeCalculatedExpression )
            CalculatorButton(
                displayedCharacter: ")", addToStringCharacter: ")",backgroundColor: .blue,foregroundColor: .white,toBeCalculatedExpression: toBeCalculatedExpression)
            CalculatorButton(
                displayedCharacter: "÷", addToStringCharacter: "/",backgroundColor: .black,foregroundColor: .white,toBeCalculatedExpression: toBeCalculatedExpression)
        }
        HStack {
            CalculatorButton(
                displayedCharacter: "7", addToStringCharacter: "7",
                backgroundColor: .blue,foregroundColor: .white,toBeCalculatedExpression: toBeCalculatedExpression)
            CalculatorButton(
                displayedCharacter: "8", addToStringCharacter: "8",
                backgroundColor: .blue,foregroundColor: .white,toBeCalculatedExpression: toBeCalculatedExpression)
            CalculatorButton(
                displayedCharacter: "9", addToStringCharacter: "9",
                backgroundColor: .blue,foregroundColor: .white,toBeCalculatedExpression: toBeCalculatedExpression)
            CalculatorButton(
                displayedCharacter: "×", addToStringCharacter: "*",
                backgroundColor: .black,foregroundColor: .white,toBeCalculatedExpression: toBeCalculatedExpression)
        }
        HStack {
            CalculatorButton(
                displayedCharacter: "4", addToStringCharacter: "4",
                backgroundColor: .blue,foregroundColor: .white,toBeCalculatedExpression: toBeCalculatedExpression)
            CalculatorButton(
                displayedCharacter: "5", addToStringCharacter: "5",
                backgroundColor: .blue,foregroundColor: .white,toBeCalculatedExpression: toBeCalculatedExpression)
            CalculatorButton(
                displayedCharacter: "6", addToStringCharacter: "6",
                backgroundColor: .blue,foregroundColor: .white,toBeCalculatedExpression: toBeCalculatedExpression)
            CalculatorButton(
                displayedCharacter: "−", addToStringCharacter: "-",
                backgroundColor: .black,foregroundColor: .white,toBeCalculatedExpression: toBeCalculatedExpression)
        }
        //.frame(height: geometry.size.height / 6)
        HStack {
            CalculatorButton(
                displayedCharacter: "1", addToStringCharacter: "1",
                backgroundColor: .blue,foregroundColor: .white,toBeCalculatedExpression: toBeCalculatedExpression)
            CalculatorButton(
                displayedCharacter: "2", addToStringCharacter: "2",
                backgroundColor: .blue,foregroundColor: .white,toBeCalculatedExpression: toBeCalculatedExpression)
            CalculatorButton(
                displayedCharacter: "3", addToStringCharacter: "3",
                backgroundColor: .blue,foregroundColor: .white,toBeCalculatedExpression: toBeCalculatedExpression)
            CalculatorButton(
                displayedCharacter: "+", addToStringCharacter: "+",
                backgroundColor: .black,foregroundColor: .white,toBeCalculatedExpression: toBeCalculatedExpression)
        }
        //.frame(height: geometry.size.height / 6)
        HStack {
            CalculatorButton(
                displayedCharacter: "0", addToStringCharacter: "0",
                backgroundColor: .blue,foregroundColor: .white,toBeCalculatedExpression: toBeCalculatedExpression)
            CalculatorButton(
                displayedCharacter: "00", addToStringCharacter: "00",
                backgroundColor: .blue,foregroundColor: .white,toBeCalculatedExpression: toBeCalculatedExpression)
            CalculatorButton(
                displayedCharacter: ".", addToStringCharacter: ".",
                backgroundColor: .blue,foregroundColor: .white,toBeCalculatedExpression: toBeCalculatedExpression)
            CalculatorButtonEqual(lastExpression: $lastExpression,buttonProfile:$buttonProfile,toBeCalculatedExpression: toBeCalculatedExpression)
        }
    }
}
@available(iOS 18.0, *)
#Preview {
    @Previewable @State var a=""
    @Previewable @State var b=false
    @Previewable @StateObject var toBeCalculatedExpression = ToBeCalculatedExpression.init()
    MainButtons(lastExpression: $a,buttonProfile: $b,toBeCalculatedExpression: toBeCalculatedExpression)
}
