//
/*******************************************************************************
 
 File name:     CalculatorView.swift
 Author:        FeiYehua
 
 Description:   Created for Calculator in 2024
 
 History:
 2024/10/17: File created.
 
 ********************************************************************************/


import SwiftUI

struct CalculatorView: View {
    @State private var toBeCalculatedString = ""  // 用于存储字符串
    @State private var isDeleteTapped=false
    @State private var lastExpression=""
    init() {
        // 设置分页指示器的颜色
        UIPageControl.appearance().currentPageIndicatorTintColor = UIColor.black  // 当前页的颜色
        UIPageControl.appearance().pageIndicatorTintColor = UIColor.gray.withAlphaComponent(0.5)  // 其他页的颜色
    }
    var body: some View {
        HStack{
            GeometryReader{geometry in
                VStack {
                    //GeometryReader{ geometry in
                        Text(lastExpression)  // 显示当前字符串
                            .font(.largeTitle)
                            .frame(width: geometry.size.width, height: geometry.size.height / 12,alignment:.leading)
                            .lineLimit(1)
                            .minimumScaleFactor(0.1)
                    HStack {
                        Text(toBeCalculatedString)  // 显示当前字符串
                            .font(.largeTitle)
                            .lineLimit(1)
                            .frame(width: geometry.size.width*0.8,alignment: .trailing)
                            .minimumScaleFactor(0.1)
                        let deleteButton = Button(action: {
                            
                        }) {
                            Image(systemName: "delete.left")  // 使用系统垃圾桶图标
                                .font(.title)
                                .foregroundColor(.red)
                                .onTapGesture {
                                    if !toBeCalculatedString.isEmpty
                                    {
                                        toBeCalculatedString.removeLast()
                                        isDeleteTapped = !isDeleteTapped
                                    }
                                }
                                .onLongPressGesture(perform: {
                                    toBeCalculatedString=""
                                    isDeleteTapped = !isDeleteTapped
                                })
                            //.padding()
                        }
                        
                        if #available(iOS 17, *) {
                            // 只在 iOS 17 及以上版本调用 .sensoryFeedback API
                            deleteButton.sensoryFeedback(.impact, trigger: isDeleteTapped)
                        }
                    }
                    .frame(height: geometry.size.height / 12)
                    TabView {
                        VStack{
                            MainButtons(toBeCalculatedString:$toBeCalculatedString,lastExpression: $lastExpression)
                        }
                        VStack{
                            ExpandedButtons(toBeCalculatedString:$toBeCalculatedString,lastExpression:$lastExpression)
                        }
                    }
                    .frame(height: geometry.size.height*5 / 6)
                    .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
                }
            }
            .padding()
        }
    }
}

#Preview {
    CalculatorView()
}
