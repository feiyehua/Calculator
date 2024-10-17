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
    @Binding var toBeCalculatedString:String
    @Binding var lastExpression:String
    var body: some View {
        HStack {
            CalculatorButtonAC(toBeCalculatedString:$toBeCalculatedString,lastExpression:$lastExpression)
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
        //.frame(height: geometry.size.height / 6)
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
        //.frame(height: geometry.size.height / 6)
        HStack {
            CalculatorButton(
                displayedCharacter: "0", addToStringCharacter: "0",
                toBeCalculatedString: $toBeCalculatedString,backgroundColor: .blue,foregroundColor: .white)
            CalculatorButton(
                displayedCharacter: "00", addToStringCharacter: "00",
                toBeCalculatedString: $toBeCalculatedString,backgroundColor: .blue,foregroundColor: .white)
            CalculatorButton(
                displayedCharacter: ".", addToStringCharacter: ".",
                toBeCalculatedString: $toBeCalculatedString,backgroundColor: .blue,foregroundColor: .white)
            CalculatorButtonEqual(toBeCalculatedString: $toBeCalculatedString,lastExpression:$lastExpression)
        }
    }
}
#Preview {
    @State var a=""
    MainButtons(toBeCalculatedString: $a,lastExpression: $a)
}
