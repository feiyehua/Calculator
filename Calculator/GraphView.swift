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
import Charts
import math_h
struct GraphView: View {
    
    @State private var isDismissed = false
    @State private var isTapped = false
    @State private var isDeleteTapped = false
    @State private var toBeCalculatedString=""
    @State private var refreshNeeded = false
    @State private var pointsInfo:[pointInfo] = []
    struct pointInfo:Identifiable{
        var id=UUID();
        var x:Double;
        var y:Double;
    }
    func getMultiplePointsValue(startValue:Double,endValue:Double, pointsInfo:inout [pointInfo],toBeCalculatedString:String) -> Void{
        for i in stride(from: startValue, through: endValue, by: (endValue-startValue)/1000)
        {
            pointsInfo.append(pointInfo(x: i, y: getPointValue(toBeCalculatedString: toBeCalculatedString, x: i)))
        }
    }
    func getPointValue(toBeCalculatedString:String,x:Double) -> Double
    {
        let cxxString=std.string(toBeCalculatedString)
        var cxxResultString=std.string("")
        return getStringValue(cxxString, &cxxResultString, x)
    }
    var body: some View {
        NavigationView{
            ZStack {
                Chart(pointsInfo){ point in
                    PointMark(x: .value("x", point.x), y: .value("y",point.y))
                }
                .padding()
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
                        refreshNeeded.toggle()
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
        
        .partialSheet(isPresented: $isTapped,
                      onDismiss: {
            refreshNeeded.toggle()
            getMultiplePointsValue(startValue: -10, endValue: 4, pointsInfo: &pointsInfo, toBeCalculatedString: toBeCalculatedString)
        },content:{
            GraphKeyboardView(passedString: $toBeCalculatedString)
        })
        
    }
    
}

#Preview {
    GraphView()
        .attachPartialSheetToRoot()
}
