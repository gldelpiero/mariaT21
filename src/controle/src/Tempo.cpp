#include "Tempo.h"

Tempo::Tempo() {
    m_ligado = false;
}

bool Tempo::estaLigado() {
    return m_ligado;
}

void Tempo::ligar() {
    m_ligado = true;
    m_start = std::chrono::steady_clock::now();
}

void Tempo::desligar() {
    m_ligado = false;
}

void Tempo::reiniciar() {
    desligar();
    ligar();
}

double Tempo::getSegundos() {
    if (m_ligado) {
        std::chrono::steady_clock::time_point end = std::chrono::steady_clock::now();
        // return std::chrono::duration_cast<std::chrono::seconds>(end - m_start).count();
        return std::chrono::duration_cast<std::chrono::milliseconds>(end - m_start).count() / 1000.0;
    }
    else {
        return 0.0;
    }    
}