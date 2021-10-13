#ifndef _DIMENSION_H_
#define _DIMENSION_H_

#include <cmath>

class Dimension {

public:
    static const int MAX_VALUE;

    Dimension(const int& v);
    Dimension();

    const int& getValue();
    void setValue(const int& v);

    void increase();
    void decrease();

    void increase(const int& v);
    void decrease(const int& v);

    void moveToZero(const float& segundos);

    bool isPositive();
    bool isNegative();
    bool isZero();

private:
    int m_v;

    bool isValid(const int& v);
};

#endif