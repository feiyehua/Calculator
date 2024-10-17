/*
 * @Author       : FeiYehua
 * @Date         : 2024-10-15 16:48:00
 * @LastEditTime : 2024-10-15 23:47:17
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
#include <stdio.h>
#define __MATH_LONG_DOUBLE_CONSTANTS
#include<math.h>
int getTypeOfPri(int i)
{
    if(i>=0)
    {
        return i;
    }
    return -1;
}
int getValue(long double* mathExpression,int* locOfPri,int numCount, long double* result)
{
    for(int i=0;i<numCount;i++)
    {
        printf("%Lf,%d\n",mathExpression[i],locOfPri[i]);
    }
    printf("\n");
    for(int i=1;i<numCount;i++)
    {
        switch(getTypeOfPri(locOfPri[i]))
        {
            case 3:
            {
                mathExpression[i]=pow(mathExpression[i-1],mathExpression[i]);
                mathExpression[i-1]=0;
                locOfPri[i]=locOfPri[i-1];
                locOfPri[i-1]=0;
                break;
            }
            case -1:
            {
                if(locOfPri[i]!=-3)
                {
                    continue;
                }
                //printf("%Lf,i\n",mathExpression[i]);
                int startOfBracket=i;
                i++;
                while(locOfPri[i]==0)
                {
                    i++;
                }
                i--;
                mathExpression[i]=mathExpression[startOfBracket-1];
                mathExpression[startOfBracket-1]=0;
                locOfPri[i]=locOfPri[startOfBracket-1];
                locOfPri[startOfBracket]=0;
                locOfPri[startOfBracket-1]*=-1;
            }
        }
    }
    for(int i=0;i<numCount;i++)
    {
        printf("%Lf,%d\n",mathExpression[i],locOfPri[i]);
    }
    printf("\n");
    for(int i=1;i<numCount;i++)
    {
        switch(getTypeOfPri(locOfPri[i]))
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
            case -1:
            {
                //printf("%Lf,i\n",mathExpression[i]);
                int startOfBracket=i;
                i++;
                while(locOfPri[i]==0)
                {
                    i++;
                }
                i--;
                mathExpression[i]=mathExpression[startOfBracket-1];
                mathExpression[startOfBracket-1]=0;
                locOfPri[i+1]=locOfPri[startOfBracket]*-1;
                locOfPri[startOfBracket]=0;
            }
        }
    }
    for(int i=0;i<numCount;i++)
    {
        *result+=mathExpression[i];
        //printf("%Lf,",mathExpression[i]);
        mathExpression[i]=0;
    }
    //printf("\n");
    return 0;
}
