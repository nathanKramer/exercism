#include "darts.h"
#include <math.h>

uint8_t score(coordinate_t coord)
{
   float hyp = sqrt(pow(coord.x, 2) + pow(coord.y, 2));
   int score = 0;

   if (hyp <= 1.0F)
   {
      score = 10;
   }
   else if (hyp <= 5.0F)
   {
      score = 5;
   }
   else if (hyp <= 10.0F)
   {
      score = 1;
   }

   return score;
}
