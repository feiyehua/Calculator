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
    @Binding var toBeCalculatedString:String
    var body: some View {
        HStack {
            CalculatorButtonAC(toBeCalculatedString:$toBeCalculatedString)
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
                displayedCharacter: "sin", addToStringCharacter: "sin(",
                toBeCalculatedString: $toBeCalculatedString,backgroundColor: .blue,foregroundColor: .white)
            CalculatorButton(
                displayedCharacter: "cos", addToStringCharacter: "cos(",
                toBeCalculatedString: $toBeCalculatedString,backgroundColor: .blue,foregroundColor: .white)
            CalculatorButton(
                displayedCharacter: "tan", addToStringCharacter: "tan(",
                toBeCalculatedString: $toBeCalculatedString,backgroundColor: .blue,foregroundColor: .white)
            CalculatorButton(
                displayedCharacter: "×", addToStringCharacter: "*",
                toBeCalculatedString: $toBeCalculatedString,backgroundColor: .black,foregroundColor: .white)
        }
        HStack {
            CalculatorButton(
                displayedCharacter: "sin-1", addToStringCharacter: "arcsin(",
                toBeCalculatedString: $toBeCalculatedString,backgroundColor: .blue,foregroundColor: .white)
            CalculatorButton(
                displayedCharacter: "cos-1", addToStringCharacter: "arccos(",
                toBeCalculatedString: $toBeCalculatedString,backgroundColor: .blue,foregroundColor: .white)
            CalculatorButton(
                displayedCharacter: "tan-1", addToStringCharacter: "arctan(",
                toBeCalculatedString: $toBeCalculatedString,backgroundColor: .blue,foregroundColor: .white)
            CalculatorButton(
                displayedCharacter: "-", addToStringCharacter: "-",
                toBeCalculatedString: $toBeCalculatedString,backgroundColor: .black,foregroundColor: .white)
        }
        //.frame(height: geometry.size.height / 6)
        HStack {
            CalculatorButton(
                displayedCharacter: "ln", addToStringCharacter: "ln(",
                toBeCalculatedString: $toBeCalculatedString,backgroundColor: .blue,foregroundColor: .white)
            CalculatorButton(
                displayedCharacter: "log10", addToStringCharacter: "log(",
                toBeCalculatedString: $toBeCalculatedString,backgroundColor: .blue,foregroundColor: .white)
            CalculatorButton(
                displayedCharacter: "exp", addToStringCharacter: "e^(",
                toBeCalculatedString: $toBeCalculatedString,backgroundColor: .blue,foregroundColor: .white)
            CalculatorButton(
                displayedCharacter: "+", addToStringCharacter: "+",
                toBeCalculatedString: $toBeCalculatedString,backgroundColor: .black,foregroundColor: .white)
        }
        HStack {
            CalculatorButton(
                displayedCharacter: "π", addToStringCharacter: "pi",
                toBeCalculatedString: $toBeCalculatedString,backgroundColor: .blue,foregroundColor: .white)
            CalculatorButton(
                displayedCharacter: "e", addToStringCharacter: "e",
                toBeCalculatedString: $toBeCalculatedString,backgroundColor: .blue,foregroundColor: .white)
            CalculatorButton(
                displayedCharacter: "^", addToStringCharacter: "^",
                toBeCalculatedString: $toBeCalculatedString,backgroundColor: .blue,foregroundColor: .white)
            CalculatorButtonEqual(toBeCalculatedString: $toBeCalculatedString)
        }

    }
}

#Preview {
    @State var a=""
    ExpandedButtons(toBeCalculatedString: $a)
}
