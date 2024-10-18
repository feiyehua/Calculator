//
/*******************************************************************************
 
 File name:     ChartView.swift
 Author:        FeiYehua
 
 Description:   Created for Calculator in 2024
 
 History:
 2024/10/17: File created.
 
 ********************************************************************************/


import SwiftUI
import PartialSheet

struct GraphView: View {
    @State private var isDismissed = false
    @State private var isTapped = false
    @State private var isDeleteTapped = false
    @State private var toBeCalculatedString=""
    var body: some View {
        NavigationView{
            ZStack {
                Button(action:{
                    isTapped.toggle()
                }){
                    
                }
            }
            .navigationTitle("Graph")
            .toolbar{
                ToolbarItem(placement: .topBarLeading)
                {
                    let editButton=Button(action: {
                        isTapped.toggle()
                    }) {
                        Image(systemName: "square.and.pencil")
                    }
                    if #available(iOS 17, *) {
                        // 只在 iOS 17 及以上版本调用 .sensoryFeedback API
                        editButton.sensoryFeedback(.success, trigger: isTapped)
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    let deleteButton=Button(action: {
                        isDeleteTapped.toggle()
                        toBeCalculatedString=""
                    }) {
                        Image(systemName: "trash") // 使用系统图标
                            .foregroundStyle(.red)
                    }
                    if #available(iOS 17, *) {
                        deleteButton.sensoryFeedback(.success, trigger: isDeleteTapped)
                    }
                }
            }
        }
        
        .partialSheet(isPresented: $isTapped,content:{
            GraphKeyboardView(passedString: $toBeCalculatedString)
        })
        
    }
    
}

#Preview {
    GraphView()
        .attachPartialSheetToRoot()
}
