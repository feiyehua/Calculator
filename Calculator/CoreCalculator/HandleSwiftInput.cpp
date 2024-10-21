//
/*******************************************************************************
 
 File name:     HandleSwiftInput.c
 Author:        FeiYehua
 
 Description:   Created for Calculator in 2024
 
 History:
 2024/10/16: File created.
 
 ********************************************************************************/


#include "HandleSwiftInput.hpp"

using namespace std;
double getStringValue(string toBeCalculatedString,string* resultString,double x)//通过一个C++函数调用parseMathExpression函数，方便操作
{
    long double result=0L;
    long double mathExpression[1000];
    memset(mathExpression, 0, sizeof(mathExpression));
    int locOfPri[1000],numCount=0;
    memset(locOfPri, 0, sizeof(locOfPri));
    char toBeCalculatedCString[1000]="";
#ifdef DEBUG
    cout<<toBeCalculatedString<<endl;
#endif
    strcpy(toBeCalculatedCString, toBeCalculatedString.c_str());
    parseMathExpression(toBeCalculatedCString,mathExpression,&numCount,locOfPri,x);
    getValue(mathExpression,locOfPri,numCount,&result);
    // 创建 ostringstream 对象，将long double转换为string
    std::ostringstream oss;
    
    // 设置浮点数的精度
    oss.precision(15); // 控制精度为 15 位
    oss << result;        // 将 long double 写入流中
    
    // 获取转换后的字符串
    *resultString = oss.str();
    return result;
}
