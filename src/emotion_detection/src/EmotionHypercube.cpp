#include "../include/EmotionHypercube.h"

double fixValue(const double& value) {
    double p = round(100.0 * value) / 100.0;

    if (abs(p) <= 0.05) {
        p = 0.0;
    }

    return p;
}

EmotionHypercube::EmotionHypercube() {
    EmotionHypercube(0.0, 0.0, 0.0, 0.0);
}

EmotionHypercube::EmotionHypercube(double x, double y, double z, double w) {
    setX(x);
    setY(y);
    setZ(z);
    setW(w);
}

void EmotionHypercube::decay(const double& decayConstant) {
    updateX(x.v0 * exp(- decayConstant * x.t));
    updateY(y.v0 * exp(- decayConstant * y.t));
    updateZ(z.v0 * exp(- decayConstant * z.t));
    updateW(w.v0 * exp(- decayConstant * w.t));

    x.t += 0.1;
    y.t += 0.1;
    z.t += 0.1;
    w.t += 0.1;
}

bool EmotionHypercube::updateX(const double& value) {
    if (abs(value) <= 100.0) {        
        x.v = fixValue(value);
        return true;
    }
    return false;
}

void EmotionHypercube::setX(double value) {
    if (updateX(value)) {
        x.v0 = x.v;
        x.t = 0.0;
    }
}

bool EmotionHypercube::updateY(const double& value) {
    if (abs(value) <= 100.0) {        
        y.v = fixValue(value);
        return true;
    }
    return false;
}

void EmotionHypercube::setY(double value) {
    if (updateY(value)) {
        y.v0 = y.v;
        y.t = 0.0;
    }
}

bool EmotionHypercube::updateZ(const double& value) {
    if (abs(value) <= 100.0) {        
        z.v = fixValue(value);
        return true;
    }
    return false;
}

void EmotionHypercube::setZ(double value) {
    if (updateZ(value)) {
        z.v0 = z.v;
        z.t = 0.0;
    }
}

bool EmotionHypercube::updateW(const double& value) {
    if (abs(value) <= 100.0) {        
        w.v = fixValue(value);
        return true;
    }
    return false;
}

void EmotionHypercube::setW(double value) {
    if (updateW(value)) {
        w.v0 = w.v;
        w.t = 0.0;
    }
}

double EmotionHypercube::getX() {
    return x.v;
}

double EmotionHypercube::getY() {
    return y.v;
}

double EmotionHypercube::getZ() {
    return z.v;
}

double EmotionHypercube::getW() {
    return w.v;
}