//
    /*******************************************************************************
            
            File name:     GetNumber.c
            Author:        FeiYehua
            
            Description:   Created for Calculator in 2024
            
            History:
                    2024/10/7: File created.
            
    ********************************************************************************/
    

#include "GetNumber.h"
#include "IsSymbol.h"
long double getNumber(char mathExpression[],int lengthOfMathExpression,long double* result)
{
    *result=0;
    int i=0;
    while(mathExpression[i]!='.')
    {
        *result=*result*10+(mathExpression[i]-'0');
        i++;
    }
    i++;
    long double tmp=0.1;
    while(isSymbol(mathExpression[i])==0)
    {
        *result+=tmp*(mathExpression[i]-'0');
        tmp*=0.1;
        i++;
    }
    return *result;
}
