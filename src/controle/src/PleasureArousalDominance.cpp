#include "PleasureArousalDominance.h"

void PleasureArousalDominance::setValue(const float& p, const float& a, const float& d) {
    this->pleasure.setValue(p);
    this->arousal.setValue(a);
    this->dominance.setValue(d);

    if (m_onChange != nullptr) {
        m_onChange(p, a, d);
    }
}

void PleasureArousalDominance::moveToZero(const float& segundos) {
    this->pleasure.moveToZero(segundos);
    this->arousal.moveToZero(segundos);
    this->dominance.moveToZero(segundos);

    if (m_onChange != nullptr) {
        m_onChange(pleasure.getValue(), arousal.getValue(), dominance.getValue());
    }
}

bool PleasureArousalDominance::isZero() {
    return (
        this->pleasure.isZero()
        && this->arousal.isZero()
        && this->dominance.isZero()        
    );
}

void PleasureArousalDominance::setMaxValue() {
    setValue(Dimension::MAX_VALUE, Dimension::MAX_VALUE, Dimension::MAX_VALUE);
}

void PleasureArousalDominance::setMinValue() {
    setValue(-Dimension::MAX_VALUE, -Dimension::MAX_VALUE, -Dimension::MAX_VALUE);
}

PleasureArousalDominance::EmocoesBasicas PleasureArousalDominance::getEmotion() {
    if (pleasure.isPositive()) {
        if (arousal.isPositive()) {
            if (dominance.isPositive()) {
                return PleasureArousalDominance::EmocoesBasicas::Alegria;
            }
            else {
                return PleasureArousalDominance::EmocoesBasicas::Surpresa;
            }
        }
        else {
            if (dominance.isPositive()) {
                return PleasureArousalDominance::EmocoesBasicas::Confianca;
            }
            else {
                return PleasureArousalDominance::EmocoesBasicas::Antecipacao;
            }
        }
    }
    else {
        if (arousal.isPositive()) {
            if (dominance.isPositive()) {
                return PleasureArousalDominance::EmocoesBasicas::Raiva;
            }
            else {
                return PleasureArousalDominance::EmocoesBasicas::Medo;
            }
        }
        else {
            if (dominance.isPositive()) {
                return PleasureArousalDominance::EmocoesBasicas::Nojo;
            }
            else {
                return PleasureArousalDominance::EmocoesBasicas::Tristeza;
            }
        }
    }
}

float PleasureArousalDominance::getIntensity() {
    float p;
    float a;
    float d;
    float delta{Dimension::MAX_VALUE / 10.0f}; // 10 %

    p = fabs((float) pleasure.getValue() );
    a = fabs((float) arousal.getValue() );
    d = fabs((float) dominance.getValue() );

    // extrapolation: 70% < x <= 100%
    if ( (p > 7.0f * delta) && (a > 7.0f * delta) && (d > 7.0f * delta) ) {
        return 100.0f;
    }

    // basic: 40% < x <= 70%
    if ( (p > 4.0f * delta) && (a > 4.0f * delta) && (d > 4.0f * delta) ) {
        return 66.0f;
    }

    // attenuation: 10% < x <= 40%
    if ( (p > delta) && (a > delta) && (d > delta) ) {
        return 33.0f;
    }
    
    return 0.0f;
}

void PleasureArousalDominance::setOnChangeCallback(void (*onChange) (const float p, const float a, const float d))
{
    m_onChange = onChange;
}