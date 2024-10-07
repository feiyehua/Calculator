//
    /*******************************************************************************
            
            File name:     GetValue.c
            Author:        FeiYehua
            
            Description:   Created for Calculator in 2024
            
            History:
                    2024/10/7: File created.
            
    ********************************************************************************/
    

#include "GetValue.h"
int getValue(long double* mathExpression,int* locOfPri,int numCount, long double* result)
{
    for(int i=0;i<numCount;i++)
    {
        if(locOfPri[i]==-1)
        {
            mathExpression[i]=mathExpression[i-1]/mathExpression[i];
            mathExpression[i-1]=0;
        }
        else if(locOfPri[i]==1)
        {
            mathExpression[i]=mathExpression[i-1]*mathExpression[i];
            mathExpression[i-1]=0;
        }
    }
    for(int i=0;i<numCount;i++)
    {
        *result+=mathExpression[i];
    }
    return 0;
}