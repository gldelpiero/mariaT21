/*
 * Pleasure - Arousal - Dominance
 * 
 */
#ifndef _PLEASURE_AROUSAL_DOMINANCE_
#define _PLEASURE_AROUSAL_DOMINANCE_

#include "Dimension.h"
#include <ros/ros.h>
#include <controle/Emotion.h>

class PleasureArousalDominance {
public:
	enum class EmocoesBasicas {
		Raiva = 0u,		// - pleasure, + arousal, + dominance
		Nojo = 1u,		// - pleasure, - arousal, + dominance
		Medo = 2u,		// - pleasure, + arousal, - dominance
		Alegria = 3u,	// + pleasure, + arousal, + dominance
		Tristeza = 4u,	// - pleasure, - arousal, - dominance
		Surpresa = 5u,	// + pleasure, + arousal, - dominance
		Confianca = 6u,	// + pleasure, - arousal, + dominance
		Antecipacao = 7u	// + pleasure, - arousal, - dominance
	};

    Dimension pleasure{0};
    Dimension arousal{0};
    Dimension dominance{0};

    void setValue(const float& p, const float& a, const float& d);
	void setMaxValue();
	void setMinValue();
	void moveToZero(const float& segundos);
	bool isZero();

	EmocoesBasicas getEmotion();
	float getIntensity();

	void setOnChangeCallback(void (*onChange) (const float p, const float a, const float d));

private:
	void (*m_onChange) (const float p, const float a, const float d) {nullptr};
};

#endif 