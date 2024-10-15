/*
 * @Author       : FeiYehua
 * @Date         : 2024-10-07 11:56:07
 * @LastEditTime : 2024-10-15 19:10:54
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
#include"GetValue.h"
#include<string.h>

enum typeOfCal
{
    NORMAL,SIN,COS,TAN,ARCSIN,ARCCOS,ARCTAN,LN
};
struct bracketInfo
{
    char* place;
    int numcount;
    enum typeOfCal typeOfPriCal;//存储括号前涉及的运算种类
}leftBracketInfo[1000];
int leftBracketCount;
int parseMathExpression(char* originalExpression, long double* mathExpression, int* numCount, int* locOfPri)
{
    *numCount=0;
    //memset(mathExpression,0,sizeof(mathExpression));
    char *nextPtr=originalExpression;
    while(*nextPtr!='\0'&&*nextPtr!='\n')
    {
        originalExpression=nextPtr;
        mathExpression[*numCount]=strtold(originalExpression,&nextPtr);
        //printf("%Lf,%d\n",mathExpression[*numCount],*numCount);
        if(nextPtr==originalExpression)
        {
            nextPtr++;
            switch (*originalExpression)
            {
                case '*':
                {
                    locOfPri[*numCount]=1;
                    break;
                }
                case '/':
                {
                    locOfPri[*numCount]=2;
                    break;
                }
                case '^':
                {
                    locOfPri[*numCount]=3;
                    break;
                }
                case '(':
                {
                    leftBracketCount++;
                    leftBracketInfo[leftBracketCount].place=nextPtr;
                    leftBracketInfo[leftBracketCount].numcount=*numCount;
                    leftBracketInfo[leftBracketCount].typeOfPriCal=NORMAL;
                    break;
                }
                case ')':
                {
                    long double tmp=0;
                    int placeOfLeftBracket=leftBracketInfo[leftBracketCount].numcount;
                    int numberOfNumbersInBracket=*numCount-leftBracketInfo[leftBracketCount].numcount;
                    //printf("%d\n",*numCount);
                    getValue(&mathExpression[placeOfLeftBracket],&locOfPri[placeOfLeftBracket],numberOfNumbersInBracket,&tmp);
                    locOfPri[*numCount-1]=locOfPri[placeOfLeftBracket];
                    if(locOfPri[placeOfLeftBracket]!=0)
                    {
                        locOfPri[placeOfLeftBracket]=-1;
                    }
                    else
                    {
                        locOfPri[placeOfLeftBracket]=0;
                    }
                    mathExpression[*numCount-1]=tmp;
                    leftBracketCount--;
                    break;
                }
                default:
                { 
                    locOfPri[*numCount]=0;
                    break;
                }
            }
            continue;
        }
        (*numCount)++;
        //printf("%d %d",*numCount,)
    }

    return 0;
}
