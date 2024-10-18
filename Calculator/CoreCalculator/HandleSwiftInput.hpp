//
    /*******************************************************************************
            
            File name:     HandleSwiftInput.h
            Author:        FeiYehua
            
            Description:   Created for Calculator in 2024
            
            History:
                    2024/10/16: File created.
            
    ********************************************************************************/
    

#ifndef HandleSwiftInput_hpp
#define HandleSwiftInput_hpp
extern "C"
{
    #include"ParseMathExpression.h"
    #include"GetValue.h"
}
#include <sstream>
#include<string>
#include<iostream>
double getStringValue(std::string,std::string*,double);
#endif /* HandleSwiftInput_h */
