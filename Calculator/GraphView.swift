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

struct GraphView: View {
    @State private var isDismissed = false
    @State private var isTapped = false
    @State private var isDeleteTapped = false
    @State private var toBeCalculatedString=""
    @State private var refreshNeeded = false
    @State private var isCropTapped = false
    @State private var pointsInfo:[pointInfo] = []
    @State private var startValue = -10.0
    @State private var endValue = 10.0
    struct pointInfo:Identifiable{
        var id=UUID();
        var x:Double;
        var y:Double;
    }
    func getMultiplePointsValue(startValue:Double,endValue:Double, pointsInfo:inout [pointInfo],toBeCalculatedString:String) -> Void{
        if !(toBeCalculatedString=="")
        {
            for i in stride(from: startValue, through: endValue, by: (endValue-startValue)/1000)
            {
                pointsInfo.append(pointInfo(x: i, y: getPointValue(toBeCalculatedString: toBeCalculatedString, x: i)))
            }
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
            VStack {
                Chart(pointsInfo){ point in
                    PointMark(x: .value("x", point.x), y: .value("y",point.y))
                }
                .animation(.easeOut(duration: 0.5),value: isTapped)
                .padding()
            }
            .navigationTitle("Graph")
            .toolbar{
                ToolbarItem(placement: .topBarLeading)
                {
                    let editButton=Button(action: {
                        pointsInfo.removeAll()
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
                        pointsInfo.removeAll()
                        toBeCalculatedString=""
                    }) {
                        Image(systemName: "eraser.line.dashed") // 使用系统图标
                            .foregroundStyle(.red)
                    }
                    if #available(iOS 17, *) {
                        deleteButton.sensoryFeedback(.success, trigger: isDeleteTapped)
                    }
                }
                ToolbarItem(placement: .bottomBar){
                    let cropButton=Button(action: {
                        isCropTapped.toggle()
                    }) {
                        Image(systemName: "crop") // 使用系统图标
                            .foregroundStyle(.red)
                    }
                    if #available(iOS 17, *) {
                        cropButton.sensoryFeedback(.impact, trigger: isCropTapped)
                    }
                }
            }
        }
        
        .partialSheet(isPresented: $isTapped,
                      onDismiss: {
            refreshNeeded.toggle()
            getMultiplePointsValue(startValue: startValue, endValue: endValue, pointsInfo: &pointsInfo, toBeCalculatedString: toBeCalculatedString)
        },content:{
            GraphKeyboardView(passedString: $toBeCalculatedString)
        })
        
        .partialSheet(isPresented: $isCropTapped, onDismiss: {
            refreshNeeded.toggle()
            getMultiplePointsValue(startValue: startValue, endValue: endValue, pointsInfo: &pointsInfo, toBeCalculatedString: toBeCalculatedString)
        },content: {
            EditDrawingRangeView(startValue: $startValue, endValue: $endValue)
        })
    }
    
}

#Preview {
    GraphView()
        .attachPartialSheetToRoot()
}
