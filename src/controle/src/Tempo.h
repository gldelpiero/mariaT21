#ifndef _TEMPO_H_
#define _TEMPO_H_

#include <chrono>
#include <ros/ros.h>

class Tempo {

public:
    Tempo();

    bool estaLigado();
    void ligar();
    void desligar();
    void reiniciar();
    double getSegundos();

private:
    bool m_ligado;
    std::chrono::steady_clock::time_point m_start;
};

#endif