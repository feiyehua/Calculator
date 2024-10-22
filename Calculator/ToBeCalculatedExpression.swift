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
    private let invalidStrings = ["*", "+", "-", "/", "^",")"]//这些不需要在前面补上乘号
    private let validStrings = ["pi", "e",")"]
    init() {
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
    func removeAll(){
        addedItem.removeAll()
        toBeCalculatedString=""
    }
    private func isDigitsOnly(_ string: String) -> Bool {
        let digitsSet = CharacterSet.decimalDigits
        return string.rangeOfCharacter(from: digitsSet.inverted) == nil
    }
    private func checkIfMultiplicationIsOmitted(addedString:inout String)
    {
        if let unwrappedLastAddedString = addedItem.last{
            if((isDigitsOnly(unwrappedLastAddedString)||validStrings.contains(unwrappedLastAddedString))//添加前的内容中含有数字（或者pi，e）
               && (!invalidStrings.contains(addedString)) && (!isDigitsOnly(addedString)))//添加的不是数字、右括号或者运算符号
            {
                addedString.insert("*", at: addedString.startIndex)
            }
        }
    }
}
