#include "../include/general_functions.h"
#include <cmath>

/// Converts an angle in degrees to an angle in radians
    /**
        @param deg the angle in degrees
        @return the angle in radians
        @see radToDeg
    */
double GeneralFunctions::degToRad(double deg) { 
    return deg * M_PI / 180.0; 
}

/// Converts an angle in radians to an angle in degrees
    /**
        @param rad the angle in radians
        @return the angle in degrees
        @see degToRad
    */
double GeneralFunctions::radToDeg(double rad) {
    return rad * 180.0 / M_PI;
}

/// Converts values z and w of a quaternions to yaw (z-axis rotation)
    /**
        @param z
        @param w
    */
double GeneralFunctions::quaternionsToAngle(double z, double w) {
    double s{2.0 * (z * w)};
    double c{1 - 2 * z * z};

    return radToDeg(atan2(s, c));
}

/// Compare two floats f1 and f2
bool GeneralFunctions::floatCompare(float f1, float f2) {
    
    float epsilon = 1e-2f; // 0.01
    
    if (fabsf(f1 - f2) <= epsilon)
        return true;
    
    return fabsf(f1 - f2) <= epsilon * fmaxf( fabsf(f1), fabsf(f2) );
}

bool GeneralFunctions::doubleCompare(double f1, double f2) {
    
    double epsilon = 1e-2; // 0.01
    
    if (fabs(f1 - f2) <= epsilon)
        return true;
    
    return fabs(f1 - f2) <= epsilon * fmax( fabs(f1), fabs(f2) );
}