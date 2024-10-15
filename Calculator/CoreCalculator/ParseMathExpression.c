/*
 * @Author       : FeiYehua
 * @Date         : 2024-10-07 11:56:07
 * @LastEditTime : 2024-10-15 08:02:09
 * @LastEditors  : FeiYehua
 * @Description  : 
 * @FilePath     : ParseMathExpression.c
 *      © 2024 FeiYehua
 */

//
    /*******************************************************************************
            
            File name:     ParseMathExpression.c
            Author:        FeiYehua
            
            Description:   Created for Calculator in 2024
            
            History:
                    2024/10/7: File created.
            
    ********************************************************************************/
    

#include "ParseMathExpression.h"
#include"stdlib.h"
#include<string.h>
int parseMathExpression(char* originalExpression, long double* mathExpression, int* numCount, int* locOfPri)
{
    *numCount=0;
    //memset(mathExpression,0,sizeof(mathExpression));
    char *nextPtr=originalExpression;
    while(*nextPtr!='\0'&&*nextPtr!='\n')
    {
        originalExpression=nextPtr;
        mathExpression[*numCount]=strtold(originalExpression,&nextPtr);
        if(nextPtr==originalExpression)
        {
            nextPtr++;
            switch (*originalExpression)
            {
                case '*':
                {
                    locOfPri[*numCount]=1;
                }
                case '/':
                {
                    locOfPri[*numCount]=2;
                }
                case '^':
                {
                    locOfPri[*numCount]=3;
                }
                default:
                {
                    locOfPri[*numCount]=0;
                }
            }
            continue;
        }
        (*numCount)++;
    }

    return 0;
}
