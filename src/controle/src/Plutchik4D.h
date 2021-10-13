#ifndef _PLUTCHIK4D_H_
#define _PLUTCHIK4D_H_

#include "Dimension.h"
#include "PleasureArousalDominance.h"

class Plutchik4D {
public:
    Plutchik4D();
    Plutchik4D(PleasureArousalDominance pad);

    void setValuesFromPAD(PleasureArousalDominance pad);

    Dimension joy_sadness;
    Dimension surprise_anticipation;
    Dimension anger_fear;
    Dimension trust_disgust;
};

#endif
