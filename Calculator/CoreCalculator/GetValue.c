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
#if DEBUG
    for(int i=0;i<numCount;i++)
    {
        printf("%Lf,%d\n",mathExpression[i],locOfPri[i]);
    }
    printf("\n");
#endif
    int flag=0;
    for(int i=1;i<numCount;i++)
    {
        //用一个flag标志^的类型
        //如果此前读到过-3，即涉及括号，则再次读到3时，locOfPri[i-1]=0
        //如果没有，则locOfPri[i-1]*=-1
//        示例0：
//        5.000000,0
//        2.718282,1
//        2.000000,3
//        flag=0，计算乘方后应该将1前移并补上-1
//        示例1:
        switch(locOfPri[i])
        {
            case 3:
            {
                mathExpression[i]=pow(mathExpression[i-1],mathExpression[i]);
                mathExpression[i-1]=0;
                locOfPri[i]=locOfPri[i-1];
                //locOfPri[i-1]=0;
                switch (flag) {
                    case 1:
                        locOfPri[i-1]=0;
                        break;
                    case 0:
                        locOfPri[i-1]*=-1;
                        break;
                    default:
                        break;
                }
                flag=0;
                break;
            }
            case -3:
            {
                flag=1;
                //printf("%Lf,i\n",mathExpression[i]);
                int startOfBracket=i;
                i++;
                while(locOfPri[i]!=3)
                {
                    locOfPri[i]=0;
                    i++;
                }
                i--;
                mathExpression[i]=mathExpression[startOfBracket-1];
                mathExpression[startOfBracket-1]=0;
                locOfPri[i]=locOfPri[startOfBracket-1];
                locOfPri[startOfBracket]=(startOfBracket==i ? locOfPri[startOfBracket] : 0);
                locOfPri[startOfBracket-1]*=-1;
                break;
            }
            default:
                break;
        }
    }
#if DEBUG
    for(int i=0;i<numCount;i++)
    {
        printf("%Lf,%d\n",mathExpression[i],locOfPri[i]);
    }
    printf("\n");
#endif
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
                while(locOfPri[i]!=locOfPri[startOfBracket]*-1)
                {
                    locOfPri[i]=0;
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
