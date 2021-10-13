#include "Plutchik4D.h"

Plutchik4D::Plutchik4D() {
    this->anger_fear.setValue(0);
    this->joy_sadness.setValue(0);
    this->surprise_anticipation.setValue(0);
    this->trust_disgust.setValue(0);
}

Plutchik4D::Plutchik4D(PleasureArousalDominance pad) {
    setValuesFromPAD(pad);
}

void Plutchik4D::setValuesFromPAD(PleasureArousalDominance pad) {
    PleasureArousalDominance::EmocoesBasicas emocao = pad.getEmotion();
    int intensity = (int) ceil(pad.getIntensity());

    switch (emocao) {
    case PleasureArousalDominance::EmocoesBasicas::Alegria :
        this->joy_sadness.setValue(+ intensity);

    case PleasureArousalDominance::EmocoesBasicas::Tristeza :
        this->joy_sadness.setValue(- intensity);

    case PleasureArousalDominance::EmocoesBasicas::Raiva :
        this->anger_fear.setValue(+ intensity);

    case PleasureArousalDominance::EmocoesBasicas::Medo :
        this->anger_fear.setValue(- intensity);

    case PleasureArousalDominance::EmocoesBasicas::Surpresa :
        this->surprise_anticipation.setValue(+ intensity);

    case PleasureArousalDominance::EmocoesBasicas::Antecipacao :
        this->surprise_anticipation.setValue(- intensity);
    
    case PleasureArousalDominance::EmocoesBasicas::Confianca :
        this->trust_disgust.setValue(+ intensity);

    case PleasureArousalDominance::EmocoesBasicas::Nojo :
        this->trust_disgust.setValue(- intensity);

    }
}