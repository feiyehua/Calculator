//
/*******************************************************************************
 
 File name:     HistoryView.swift
 Author:        FeiYehua
 
 Description:   Created for Calculator in 2024
 
 History:
 2024/10/17: File created.
 
 ********************************************************************************/


import SwiftUI

struct HistoryView: View {
    @State private var fileContent: [String] = []
    @State private var isTapped=false
    func getExpression(equation:String) -> String {
        let result = equation.split(separator: "=")
        return String(result.first ?? "")
    }
    func getResult(equation:String) -> String {
        let result = equation.split(separator: "=")
        return String(result.last ?? "")
    }
    var body: some View {
        NavigationView{
            List(fileContent, id: \.self) { line in
                Text(line)
                    .contextMenu{
                        Button{
                            UIPasteboard.general.string=line
                        }label: {
                            Label("Copy Equation",systemImage: "doc.on.doc")
                        }
                        Button{
                            UIPasteboard.general.string=getResult(equation: line)
                        }label: {
                            Label("Copy Result",systemImage: "equal")
                        }
                        Button{
                            UIPasteboard.general.string=getExpression(equation: line)
                        }label: {
                            Label("Copy Expression",systemImage: "function")
                        }
                    }
            }
            .navigationTitle("History")
            .toolbar {
                            // 添加右侧按钮
                            ToolbarItem(placement: .navigationBarTrailing) {
                                let deleteButton=Button(action: {
                                    clearHistory()
                                    fileContent=readFromFile().components(separatedBy: "\n")
                                    isTapped.toggle()
                                }) {
                                    Image(systemName: "trash") // 使用系统图标
                                        .foregroundStyle(.red)
                                }
                                if #available(iOS 17, *) {
                                        // 只在 iOS 17 及以上版本调用 .sensoryFeedback API
                                    deleteButton.sensoryFeedback(.success, trigger: isTapped)
                                    }
                            }
                        }
            .onAppear{
                fileContent=readFromFile().components(separatedBy: "\n")
            }
        }
        
    }
}

#Preview {
    HistoryView()
}
