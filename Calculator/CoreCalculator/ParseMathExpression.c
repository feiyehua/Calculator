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
enum typeOfCal//枚举涉及到的函数类型，提高代码可读性
{
    NORMAL,SIN,COS,TAN,ARCSIN,ARCCOS,ARCTAN,LN,LOG
};
struct bracketInfo//存储一个括号的信息
{
    int numcount;//存储括号中含有的数字数量
    enum typeOfCal typeOfPriCal;//存储括号前涉及的运算种类
}leftBracketInfo[1000];
int leftBracketCount;//存储还未处理的左括号个数
long double getValueOfFunction(enum typeOfCal typeOfPriCal,long double tmp)
{
    switch (typeOfPriCal)//检查括号是否涉及特殊函数，如果涉及，则修改计算得出的值
    {
        case SIN:
            return sinl(tmp);
            break;
        case COS:
            return cosl(tmp);
            break;
        case TAN:
            return tanl(tmp);
            break;
        case LN:
            return logl(tmp);
            break;
        case LOG:
            return log10l(tmp);
            break;
        case ARCSIN:
            return asinl(tmp);
            break;
        case ARCCOS:
            return acosl(tmp);
            break;
        case ARCTAN:
            return atanl(tmp);
            break;
        default:
            return tmp;
            break;
    }
}
int parseMathExpression(char* originalExpression, long double* mathExpression, int* numCount, int* locOfPri,double x)//表达式解析的核心函数
//locOfPri存储了数字i前的一个符号
{
    *numCount=0;
    char *nextPtr=originalExpression;
    leftBracketCount=0;
    while(*nextPtr!='\0'&&*nextPtr!='\n')//这个函数一直持续到解析完整个字符串
    {
        originalExpression=nextPtr;
        mathExpression[*numCount]=strtold(originalExpression,&nextPtr);
        //使用strtold函数，将表达式转化为一个long double型
        //strtold函数会自动应对数字前的+、-号，无法处理* / 和乘方符号
        //第二个参数是一个二重指针，是结束解析的位置
        if(nextPtr==originalExpression)//这说明前方没有可以解析的数字
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
                case 'p'://读到了pi、e、x等字母
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
                case 'x':
                {
                    mathExpression[*numCount]=x;
                    (*numCount)++;
                    break;
                }
                case '('://读到了左括号：左括号的相关信息
                {
                    leftBracketCount++;
                    leftBracketInfo[leftBracketCount].numcount=*numCount;
                    leftBracketInfo[leftBracketCount].typeOfPriCal=NORMAL;
                    (*numCount)++;//相当于在括号后添加了一个“0+”，方便处理连续括号
                    break;
                }
                case ')':
                    //读到了右括号，此时去找到相应的左括号信息
                    //括号的种类可以表示为两种：
                    //1、括号内没有更多的括号
                    //2、括号内还嵌套了更多括号
                    //由于每个左括号都能和右括号配对，所以当读到右括号时，与其配对的必然是上一个左括号，且其中必然没有其他括号
                    //因此可以直接求值
                {
                    long double tmp=0;
                    int placeOfLeftBracket=leftBracketInfo[leftBracketCount].numcount;
                    int numberOfNumbersInBracket=*numCount-leftBracketInfo[leftBracketCount].numcount;
                    //printf("%d\n",*numCount);
                    getValue(&mathExpression[placeOfLeftBracket],&locOfPri[placeOfLeftBracket],numberOfNumbersInBracket,&tmp);
                    if(placeOfLeftBracket!=leftBracketInfo[leftBracketCount-1].numcount)
                        //这里进行特判：如果没有涉及连续括号，则按照常规处理括号的方式处理；如果涉及了括号连续嵌套，则前面的符号属于第一个括号，内层括号的符号不做处理
                    {
                        locOfPri[*numCount-1]=locOfPri[placeOfLeftBracket];
                        locOfPri[placeOfLeftBracket]*=-1;
                    }
                    mathExpression[*numCount-1]=getValueOfFunction(leftBracketInfo[leftBracketCount].typeOfPriCal,tmp);//求出括号外函数的值
                    leftBracketCount--;//将左括号计数减少1
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
                case 'a'://反三角函数
                {
                    leftBracketCount++;
                    leftBracketInfo[leftBracketCount].numcount=*numCount;
                    nextPtr+=2;
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
                    nextPtr+=4;
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
    }
    return 0;
}
