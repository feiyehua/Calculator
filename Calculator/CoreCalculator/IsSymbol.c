//
    /*******************************************************************************
            
            File name:     IsSymbol.c
            Author:        FeiYehua
            
            Description:   Created for Calculator in 2024
            
            History:
                    2024/10/7: File created.
            
    ********************************************************************************/
    

#include "IsSymbol.h"
int isSymbol(char c)
{
    if(c=='+'||c=='-'||c=='*'||c=='/')
    {
        return 1;
    }
    return 0;
}
