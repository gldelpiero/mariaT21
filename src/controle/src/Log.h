#ifndef _LOG_H_
#define _LOG_H_

#include <time.h>
#include <iostream>	
#include <fstream>

#define TAMANHO_NOME_ARQUIVO 80

class Log {
public:
    Log(std::string assunto);
    ~Log();
    std::string getFileName();

private:    
    void createFile(std::string assunto);
    std::string m_nome_arquivo;
    std::ofstream m_file;
};

#endif