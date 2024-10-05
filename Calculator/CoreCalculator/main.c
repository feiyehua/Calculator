/*
 * @Author       : FeiYehua
 * @Date         : 2024-10-07 00:23:00
 * @LastEditTime : 2024-10-07 00:55:09
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
    

#include "GetNumber.h"
#include<string.h>
#include <stdlib.h>
char testNumber[1000];
long double result;
char *endptr;
int main(void)
{
    scanf("%s",testNumber);
    getNumber(testNumber, strlen(testNumber), &result);
    printf("%.20Lf\n",result);
    long double num=strtold(testNumber,&endptr);
    printf("%.20Lf\n",num);
    return 0;
}
