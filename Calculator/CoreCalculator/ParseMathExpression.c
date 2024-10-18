/*
 * @Author       : FeiYehua
 * @Date         : 2024-10-07 11:56:07
 * @LastEditTime : 2024-10-16 12:38:14
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
    
#define M_El        0xa.df85458a2bb4a9bp-2L
#define M_PIl       0xc.90fdaa22168c235p-2L //Xcode里面不认__MATH_LONG_DOUBLE_CONSTANTS宏，God knows why
#include "ParseMathExpression.h"
#include"GetValue.h"
#include<stdlib.h>
#include<string.h>
#include<stdio.h>
#include<math.h>
enum typeOfCal
{
    NORMAL,SIN,COS,TAN,ARCSIN,ARCCOS,ARCTAN,LN,LOG
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
    //printf("%d,leftBracketCount\n",leftBracketCount);
    leftBracketCount=0;
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
                case '-'://读到-号，说明下一个数在括号/函数内，或者下一个数字是未知数。
                //将负号解读为-1，并在下一个数的位置标注为乘号
                {
                    mathExpression[*numCount]=-1;
                    (*numCount)++;
                    locOfPri[*numCount]=1;
                    break;
                }
                case '+'://+号同理
                {
                    mathExpression[*numCount]=1;
                    (*numCount)++;
                    locOfPri[*numCount]=1;
                    break;
                }
                case 'p':
                {
                    mathExpression[*numCount]=M_PIl;
                    (*numCount)++;
                    nextPtr++;
                    break;
                }
                case 'e':
                {
                    mathExpression[*numCount]=M_El;
                    (*numCount)++;
                    break;
                }
                case '(':
                {
                    leftBracketCount++;
                    leftBracketInfo[leftBracketCount].numcount=*numCount;
                    leftBracketInfo[leftBracketCount].typeOfPriCal=NORMAL;
                    (*numCount)++;
                    break;
                }
                case ')':
                {
                    long double tmp=0;
                    int placeOfLeftBracket=leftBracketInfo[leftBracketCount].numcount;
                    int numberOfNumbersInBracket=*numCount-leftBracketInfo[leftBracketCount].numcount;
                    //printf("%d\n",*numCount);
                    getValue(&mathExpression[placeOfLeftBracket],&locOfPri[placeOfLeftBracket],numberOfNumbersInBracket,&tmp);
                    if(placeOfLeftBracket!=leftBracketInfo[leftBracketCount-1].numcount)
                    {
                        locOfPri[*numCount-1]=locOfPri[placeOfLeftBracket];
                        locOfPri[placeOfLeftBracket]*=-1;
                    }
                    switch (leftBracketInfo[leftBracketCount].typeOfPriCal)//检查括号是否涉及特殊函数
                    {
                    case SIN:
                        mathExpression[*numCount-1]=sinl(tmp);
                        break;
                    case COS:
                        mathExpression[*numCount-1]=cosl(tmp);
                        break;
                    case TAN:
                        mathExpression[*numCount-1]=tanl(tmp);
                        break;
                    case LN:
                        mathExpression[*numCount-1]=logl(tmp);
                        break;
                    case LOG:
                        mathExpression[*numCount-1]=log10l(tmp);
                        break;
                    case ARCSIN:
                        mathExpression[*numCount-1]=asinl(tmp);
                        break;
                    case ARCCOS:
                        mathExpression[*numCount-1]=acosl(tmp);
                        break;
                    case ARCTAN:
                        mathExpression[*numCount-1]=atanl(tmp);
                        break;
                    default:
                        mathExpression[*numCount-1]=tmp;
                        break;
                    }
                    
                    leftBracketCount--;
                    break;
                }
                case 's'://处理特殊函数：相当于提前读入一个括号+修改leftBracketInfo[leftBracketCount].typeOfPriCal值进行特判
                {
                    leftBracketCount++;
                    leftBracketInfo[leftBracketCount].numcount=*numCount;
                    leftBracketInfo[leftBracketCount].typeOfPriCal=SIN;
                    (*numCount)++;
                    nextPtr+=3;
                    break;
                }
                case 'c':
                {
                    leftBracketCount++;
                    leftBracketInfo[leftBracketCount].numcount=*numCount;
                    leftBracketInfo[leftBracketCount].typeOfPriCal=COS;
                    (*numCount)++;
                    nextPtr+=3;
                    break;
                }
                case 't':
                {
                    leftBracketCount++;
                    leftBracketInfo[leftBracketCount].numcount=*numCount;
                    leftBracketInfo[leftBracketCount].typeOfPriCal=TAN;
                    (*numCount)++;
                    nextPtr+=3;
                    break;
                }
                case 'l':
                {
                    leftBracketCount++;
                    leftBracketInfo[leftBracketCount].numcount=*numCount;
                    if(*(originalExpression+2)=='(')
                    {
                        leftBracketInfo[leftBracketCount].typeOfPriCal=LN;
                        nextPtr+=2;
                    }
                    else
                    {
                        leftBracketInfo[leftBracketCount].typeOfPriCal=LOG;
                        nextPtr+=3;
                    }
                    (*numCount)++;
                    break;
                }
                case 'a':
                {
                    leftBracketCount++;
                    leftBracketInfo[leftBracketCount].numcount=*numCount;
                    nextPtr+=3;
                    originalExpression=nextPtr;
                    switch (*originalExpression) {
                        case 's':
                            leftBracketInfo[leftBracketCount].typeOfPriCal=ARCSIN;
                            break;
                        case 'c':
                            leftBracketInfo[leftBracketCount].typeOfPriCal=ARCCOS;
                            break;
                        case 't':
                            leftBracketInfo[leftBracketCount].typeOfPriCal=ARCTAN;
                            break;
                        default:
                            break;
                    }
                    (*numCount)++;
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
