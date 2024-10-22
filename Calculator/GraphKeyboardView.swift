//
/*******************************************************************************
 
 File name:     GraphKeyboardView.swift
 Author:        FeiYehua
 
 Description:   Created for Calculator in 2024
 
 History:
 2024/10/18: File created.
 
 ********************************************************************************/


import SwiftUI

struct GraphKeyboardView: View {
    //@Binding private var toBeCalculatedString:String  // 用于存储字符串
    @State private var isDeleteTapped=false
    @State private var lastExpression=""
    @State private var buttonProfile=false
    @ObservedObject var toBeCalculatedExpression : ToBeCalculatedExpression
    init(passedExpression:ToBeCalculatedExpression) {
        // 设置分页指示器的颜色
        UIPageControl.appearance().currentPageIndicatorTintColor = UIColor.black  // 当前页的颜色
        UIPageControl.appearance().pageIndicatorTintColor = UIColor.gray.withAlphaComponent(0.5)  // 其他页的颜色
        toBeCalculatedExpression = passedExpression
    }
    var body: some View {
        //GeometryReader{geometry in
        HStack{
            
            VStack {
                HStack {
                    Text(toBeCalculatedExpression.toBeCalculatedString)  // 显示当前字符串
                        .font(.largeTitle)
                        .lineLimit(1)
                        .frame(width: UIScreen.main.bounds.width*0.8,alignment: .trailing)
                        .minimumScaleFactor(0.1)
                    let deleteButton = Button(action: {
                        
                    }) {
                        Image(systemName: "delete.left")  // 使用系统垃圾桶图标
                            .font(.title)
                            .foregroundColor(.red)
                            .onTapGesture {
                                toBeCalculatedExpression.removeLast()
                                isDeleteTapped = !isDeleteTapped
                            }
                            .onLongPressGesture(perform: {
                                toBeCalculatedExpression.removeAll()
                                isDeleteTapped = !isDeleteTapped
                            })
                        //.padding()
                    }
                    
                    if #available(iOS 17, *) {
                        // 只在 iOS 17 及以上版本调用 .sensoryFeedback API
                        deleteButton.sensoryFeedback(.impact, trigger: isDeleteTapped)
                    }
                }
                .frame(height: UIScreen.main.bounds.height / 12)
                TabView {
                    VStack{
                        MainButtons(lastExpression: $lastExpression,buttonProfile:$buttonProfile,toBeCalculatedExpression: toBeCalculatedExpression)
                    }
                    VStack{
                        ExpandedButtons(lastExpression:$lastExpression,buttonProfile:$buttonProfile,toBeCalculatedExpression: toBeCalculatedExpression)
                    }
                }
                //.frame(height: geometry.size.height*0.7)
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
            }
        }
        .padding()
        .frame(height: UIScreen.main.bounds.height * 0.75)
    }
    
}


#Preview {
    //GraphKeyboardView()
}
