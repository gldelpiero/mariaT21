#ifndef _FUNCOES_H_
#define _FUNCOES_H_

const double PI = 3.141592653589793238463;

typedef struct point_ {
	double x;
	double y;
} Point;

double deg2rad(double deg);
double rad2deg(double rad);
double quaternions2angle(double z, double w);
int ajustaAngulo(int angulo);

#endif 