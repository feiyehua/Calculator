//
    /*******************************************************************************
            
            File name:     EditDrawingRangeView.swift
            Author:        FeiYehua
            
            Description:   Created for Calculator in 2024
            
            History:
                    2024/10/19: File created.
            
    ********************************************************************************/
    

import SwiftUI

struct EditDrawingRangeView: View {
    @Binding var startValue:Double
    @Binding var endValue:Double
    var body: some View {
        VStack{
            TextField("Start", value: $startValue, format: .number, prompt: Text("Enter start point"))
                .keyboardType(.numbersAndPunctuation)
            TextField("End", value: $endValue, format:.number,prompt: Text("Enter end point"))
                .keyboardType(.numbersAndPunctuation)
        }
        .textFieldStyle(.roundedBorder)
        .padding()
    }
}
@available(iOS 18.0, *)
#Preview {
    @Previewable @State var a=0.0
    @Previewable @State var b = 0.0
    EditDrawingRangeView(startValue: $a, endValue: $b)
}
