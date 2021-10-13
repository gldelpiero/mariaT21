#include "Log.h"

Log::Log(std::string assunto) {
    if (assunto == "") {
        assunto = "padrao";
    }

    createFile(assunto);
}

std::string Log::getFileName() {
    return m_nome_arquivo;
}

void Log::createFile(std::string assunto) {    		
    time_t rawtime;
    struct tm * timeinfo;
    char nome[TAMANHO_NOME_ARQUIVO];    

    time (&rawtime);
    timeinfo = localtime (&rawtime);
    strftime (nome, TAMANHO_NOME_ARQUIVO, "marialog_%F_%H-%M", timeinfo);

    m_nome_arquivo = nome;    
    m_nome_arquivo.append("_" + assunto + ".log");

    m_file.open(m_nome_arquivo);
}

Log::~Log() {
    m_file.close();
}