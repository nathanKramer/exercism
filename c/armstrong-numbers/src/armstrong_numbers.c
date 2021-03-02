#include "armstrong_numbers.h"
#include <stdio.h>
#include <math.h>
#include <string.h>

int char_to_int(char c)
{
   return c - '0';
}

int is_armstrong_number(int candidate)
{
   char s[16] = {'\0'};
   sprintf(s, "%d", candidate);

   int len = strlen(s);
   int sum = 0;
   for (int i = 0; i < len; i++)
      sum += pow(char_to_int(s[i]), len);

   return candidate == sum;
}
