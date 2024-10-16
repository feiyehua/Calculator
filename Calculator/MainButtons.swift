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
    @State private var isACTapped=false
    @State private var isEqualTapped=false
    @State private var is0Tapped=false
    var body: some View {
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
        //.frame(height: geometry.size.height / 6)
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
        //.frame(height: geometry.size.height / 6)
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
}
#Preview {
    //MainButtons()
}
