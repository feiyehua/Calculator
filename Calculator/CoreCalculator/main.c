/*
 * @Author       : FeiYehua
 * @Date         : 2024-10-07 00:23:00
 * @LastEditTime : 2024-10-07 12:52:27
 * @LastEditors  : FeiYehua
 * @Description  : 
 * @FilePath     : main.c
 *      © 2024 FeiYehua
 */
//
    /*******************************************************************************
            
            File name:     main.c
            Author:        FeiYehua
            
            Description:   Created for Calculator in 2024
            
            History:
                    2024/10/7: File created.
            
    ********************************************************************************/
    

#include<stdio.h>
#include<string.h>
#include <stdlib.h>
#include"ParseMathExpression.h"
#include"GetValue.h"
char testNumber[1000];
long double result;
long double mathExpression[1000];
int locOfPri[1000],numCount;
char *endptr;
int main(void)
{
    scanf("%s",testNumber);
    parseMathExpression(testNumber,mathExpression,&numCount,locOfPri);
    for(int i=0;i<numCount;i++)
    {
        printf("%d %Lf %d\n",i,mathExpression[i],locOfPri[i]);
    }
    getValue(mathExpression,locOfPri,numCount,&result);
    printf("%Lf\n",result);
    return 0;
}
