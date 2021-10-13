#ifndef _GENERAL_FUNCTIONS_H_
#define _GENERAL_FUNCTIONS_H_

#ifndef M_PI
#define M_PI 3.1415927
#endif

class GeneralFunctions {
    public:
        static double degToRad(double deg);
        static double radToDeg(double rad);
        static double quaternionsToAngle(double z, double w);
        static double fixAngle(double angle);
        static bool floatCompare(float f1, float f2);
        static bool doubleCompare(double f1, double f2);
};

#endif 