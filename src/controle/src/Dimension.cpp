#include "Dimension.h"

const int Dimension::MAX_VALUE = 100;

bool Dimension::isValid(const int& v) {
    if ( (v >= -MAX_VALUE) && (v <= MAX_VALUE) ) {
        return true;
    }
    else {
        return false;
    }    
}

Dimension::Dimension(const int& v) {
    setValue(v);
}

Dimension::Dimension() {
    setValue(0);
}

void Dimension::setValue(const int& v) {
    if ( isValid (v) ) {
        m_v = v;
    }
}

const int& Dimension::getValue() {
    return m_v;
}

void Dimension::increase(const int& v) {
    if (isValid(m_v + v)) {
        setValue(m_v + v);
    }
}

void Dimension::decrease(const int& v) {
    increase(-v);
}

void Dimension::increase() {
    increase(1);
}

void Dimension::decrease() {
    decrease(1);
}

bool Dimension::isPositive() {
    return m_v > 0;
}

bool Dimension::isNegative() {
    return m_v < 0;
}

bool Dimension::isZero() {
    return m_v == 0;
}

void Dimension::moveToZero(const float& segundos) {
    m_v = (int) truncf( ((float) m_v) * expf(- segundos) );    
}