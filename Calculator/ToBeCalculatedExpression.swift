//
    /*******************************************************************************
            
            File name:     ToBeCalculatedExpression.swift
            Author:        FeiYehua
            
            Description:   Created for Calculator in 2024
            
            History:
                    2024/10/21: File created.
            
    ********************************************************************************/
    

import Foundation

class ToBeCalculatedExpression: ObservableObject{
    @Published var toBeCalculatedString:String
    private var addedItem:[String]
    private let invalidStrings = ["*", "+", "-", "/", "^"]//这些不需要在前面补上乘号
    init(toBeCalculatedString: String) {
        self.toBeCalculatedString = ""
        self.addedItem = []
    }
    func removeLast(){
        if let unwrappedLastAddedString = addedItem.last{
            toBeCalculatedString.removeLast(unwrappedLastAddedString.count)
            addedItem.removeLast()
        }
    }
    func addNext(addedString:String)
    {
        var mutableAddedString = addedString
        checkIfMultiplicationIsOmitted(addedString: &mutableAddedString)
        addedItem.append(mutableAddedString)
        toBeCalculatedString.append(mutableAddedString)
    }
    private func isDigitsOnly(_ string: String) -> Bool {
        let digitsSet = CharacterSet.decimalDigits
        return string.rangeOfCharacter(from: digitsSet.inverted) == nil
    }
    private func checkIfMultiplicationIsOmitted(addedString:inout String)
    {
        if let unwrappedLastAddedString = addedItem.last{
            if(isDigitsOnly(unwrappedLastAddedString) && !invalidStrings.contains(unwrappedLastAddedString))
            {
                addedString.insert("*", at: addedString.startIndex)
            }
        }
    }
}
