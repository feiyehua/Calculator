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

#include <stdio.h>
#include<string.h>
#include <stdlib.h>
extern "C"
{
    #include"ParseMathExpression.h"
    #include"GetValue.h"
}
#include <sstream>
#include<string>
int getStringValue(std::string,std::string*);
#endif /* HandleSwiftInput_h */
