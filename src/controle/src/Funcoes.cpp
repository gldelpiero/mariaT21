#include "Funcoes.h"
#include <cmath>

double deg2rad(double deg) {
	return (PI * deg / 180.0);
}

double rad2deg(double rad) {
	return (180.0 * rad / PI);
}

double quaternions2angle(double z, double w) {
    double s{2.0 * (z * w)};
    double c{1 - 2 * z * z};

    return rad2deg(atan2(s, c));
}

int ajustaAngulo(int angulo) {
    if (angulo < 180) {
        return -angulo;
    }
    else {
        if (angulo >= 180) {
            return 360-angulo;
        }
        else {
            return 0;
        }
    }
}