
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
            if(*originalExpression=='*')
            {
                locOfPri[*numCount]=1;
            }
            else if(*originalExpression=='/')
            {
                locOfPri[*numCount]=-1;
            }
            continue;
        }
        (*numCount)++;
    }

    return 0;
}
