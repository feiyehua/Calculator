/*
 * @Author       : FeiYehua
 * @Date         : 2024-10-07 00:23:00
 * @LastEditTime : 2024-10-16 07:17:37
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
#ifdef CMAKE
int main(int argc,char* argv[])
{
    //scanf("%s",testNumber);
    parseMathExpression(argv[1],mathExpression,&numCount,locOfPri,0);
    #if 0
    for(int i=0;i<numCount;i++)
    {
        printf("%d %Lf %d\n",i,mathExpression[i],locOfPri[i]);
    }
    #endif
    getValue(mathExpression,locOfPri,numCount,&result);
    printf("%.15Lf\n",result);
    return 0;
}
#endif
//(1+3)^4*((5/7*8-90)*65-4)/7*9+10-11
//2*2^(4*3)
//((5/7*8-90)*6^5-4)/7
