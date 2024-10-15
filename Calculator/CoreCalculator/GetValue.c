/*
 * @Author       : FeiYehua
 * @Date         : 2024-10-15 16:48:00
 * @LastEditTime : 2024-10-15 19:04:55
 * @LastEditors  : FeiYehua
 * @Description  : 
 * @FilePath     : GetValue.c
 *      © 2024 FeiYehua
 */
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
    for(int i=1;i<numCount;i++)
    {
        switch(locOfPri[i])
        {
            case 1:
            {
                mathExpression[i]=mathExpression[i-1]*mathExpression[i];
                mathExpression[i-1]=0;
                locOfPri[i]=0;
                break;
            }
            case 2:
            {
                mathExpression[i]=mathExpression[i-1]/mathExpression[i];
                mathExpression[i-1]=0;
                locOfPri[i]=0;
                break;
            }
            case 3:
            {
                mathExpression[i]=pow(mathExpression[i-1],mathExpression[i]);
                mathExpression[i-1]=0;
                locOfPri[i]=0;
                break;
            }
            case -1:
            {
                int startOfBracket=i;
                i++;
                while(locOfPri[i]==0)
                {
                    i++;
                }
                i--;
                mathExpression[i]=mathExpression[startOfBracket-1];
                mathExpression[startOfBracket-1]=0;
            }
        }
    }
    for(int i=0;i<numCount;i++)
    {
        *result+=mathExpression[i];
        mathExpression[i]=0;
    }
    return 0;
}