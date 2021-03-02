#include "resistor_color_duo.h"
#include <stdio.h>
#define MAX_DIGITS 2;

int color_code(resistor_band_t colors[])
{
   return colors[0] * 10 + colors[1];
}
