#include "resistor_color.h"

resistor_band_t *colors()
{
   static resistor_band_t band[resistor_band_length];
   for (resistor_band_t c = 0; c < resistor_band_length; c += 1)
      band[(int)c] = c;

   return band;
}

int color_code(resistor_band_t c)
{
   return (int)c;
}
