//
    /*******************************************************************************
            
            File name:     ExpandedButtons.swift
            Author:        FeiYehua
            
            Description:   Created for Calculator in 2024
            
            History:
                    2024/10/17: File created.
            
    ********************************************************************************/
    

import SwiftUI

struct ExpandedButtons: View {
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
                displayedCharacter: "sin", addToStringCharacter: "sin(",
                backgroundColor: .blue,foregroundColor: .white,toBeCalculatedExpression: toBeCalculatedExpression)
            CalculatorButton(
                displayedCharacter: "cos", addToStringCharacter: "cos(",
                backgroundColor: .blue,foregroundColor: .white,toBeCalculatedExpression: toBeCalculatedExpression)
            CalculatorButton(
                displayedCharacter: "tan", addToStringCharacter: "tan(",
                backgroundColor: .blue,foregroundColor: .white,toBeCalculatedExpression: toBeCalculatedExpression)
            CalculatorButton(
                displayedCharacter: "×", addToStringCharacter: "*",
                backgroundColor: .black,foregroundColor: .white,toBeCalculatedExpression: toBeCalculatedExpression)
        }
        HStack {
            CalculatorButton(
                displayedCharacter: "sin-1", addToStringCharacter: "arcsin(",
                backgroundColor: .blue,foregroundColor: .white,toBeCalculatedExpression: toBeCalculatedExpression)
            CalculatorButton(
                displayedCharacter: "cos-1", addToStringCharacter: "arccos(",
                backgroundColor: .blue,foregroundColor: .white,toBeCalculatedExpression: toBeCalculatedExpression)
            CalculatorButton(
                displayedCharacter: "tan-1", addToStringCharacter: "arctan(",
                backgroundColor: .blue,foregroundColor: .white,toBeCalculatedExpression: toBeCalculatedExpression)
            CalculatorButton(
                displayedCharacter: "-", addToStringCharacter: "-",
                backgroundColor: .black,foregroundColor: .white,toBeCalculatedExpression: toBeCalculatedExpression)
        }
        //.frame(height: geometry.size.height / 6)
        HStack {
            CalculatorButton(
                displayedCharacter: "ln", addToStringCharacter: "ln(",
                backgroundColor: .blue,foregroundColor: .white,toBeCalculatedExpression: toBeCalculatedExpression)
            CalculatorButton(
                displayedCharacter: "log10", addToStringCharacter: "log(",
                backgroundColor: .blue,foregroundColor: .white,toBeCalculatedExpression: toBeCalculatedExpression)
            CalculatorButton(
                displayedCharacter: "exp", addToStringCharacter: "e^(",
                backgroundColor: .blue,foregroundColor: .white,toBeCalculatedExpression: toBeCalculatedExpression)
            CalculatorButton(
                displayedCharacter: "+", addToStringCharacter: "+",
                backgroundColor: .black,foregroundColor: .white,toBeCalculatedExpression: toBeCalculatedExpression)
        }
        HStack {
            CalculatorButton(
                displayedCharacter: "π", addToStringCharacter: "pi",
                backgroundColor: .blue,foregroundColor: .white,toBeCalculatedExpression: toBeCalculatedExpression)
            CalculatorButton(
                displayedCharacter: "e", addToStringCharacter: "e",
                backgroundColor: .blue,foregroundColor: .white,toBeCalculatedExpression: toBeCalculatedExpression)
            CalculatorButton(
                displayedCharacter: "^", addToStringCharacter: "^",
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
    ExpandedButtons(lastExpression: $a,buttonProfile: $b,toBeCalculatedExpression:toBeCalculatedExpression)
}

