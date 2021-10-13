#ifndef _EMOTION_HYPERCUBER_H_
#define _EMOTION_HYPERCUBER_H_

#include <math.h>

class EmotionHypercube {    
    public:
        EmotionHypercube();
        EmotionHypercube(double x, double y, double z, double w);

        void setX(double value);
        double getX();

        void setY(double value);
        double getY();

        void setZ(double value);
        double getZ();

        void setW(double value);
        double getW();

        void decay(const double& decayConstant);

    private:
        class ValueType {
        public:
            double v;
            double v0;
            double t;
        };

        bool updateX(const double& value);
        bool updateY(const double& value);
        bool updateZ(const double& value);
        bool updateW(const double& value);

        ValueType x;
        ValueType y;
        ValueType z;
        ValueType w;
};

#endif