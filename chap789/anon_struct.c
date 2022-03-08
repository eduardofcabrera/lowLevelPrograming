#include <stdio.h>

union vec3d
{
    struct {
        double x;
        double y;
        double z;
    } named ;
    double raw[3];
};

