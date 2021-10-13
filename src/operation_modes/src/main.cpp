#include <ros/ros.h>
#include <operation_modes/OperationModes.h>

#include <iostream>
#include <cstring>

#include <ros/ros.h>
#include <operation_modes/OperationModes.h>
#include <controle/ChangeMode.h>

ros::ServiceClient client;

bool callService(uint8_t mode) {
    controle::ChangeMode srv;

    srv.request.mode = mode;

    if (client.call(srv)) {
        ROS_INFO("ChangeMode is called with success.");
        return true;
    }
    else {
        ROS_ERROR("Failed to call service [ controle/ChangeMode ] with mode %d", mode);
        return false;
    }
}

uint8_t menu() {
    uint8_t choice;
    std::string input;
    
    while (true) {
        std::cout << std::endl
                << "--------------------------------------------------" << std::endl
                << "MARIA" << std::endl
                << "--------------------------------------------------" << std::endl
                << "Escolha um modo de operação:" << std::endl
                << "0: parar" << std::endl
                << "1: apresentar-se" << std::endl
                << "2: girar 360°" << std::endl
                << "3: aproximar-se" << std::endl
                << "4: distanciar-se" << std::endl
                << "5: seguir criança" << std::endl
                << "14: passear (mão direita)" << std::endl
                << "15: passear (mão esquerda)" << std::endl
                << "89: gravar log" << std::endl
                << "99: sair deste menu" << std::endl
                << std::endl << "--> ";

        std::cin >> input;

        try {
            choice = std::stoi(input);
            if ( (choice >= 0) && (choice <= 99) )
                break;
        }
        catch (const std::exception& e) {}
        std::cout << "Invalid input. Please choose again." << std::endl << std::endl;
    }
    return choice;
}

int main (int argc, char** argv) {
    bool isToStop{false};
    operation_modes::OperationModes op_modes;

    op_modes.code = operation_modes::OperationModes::OPERATION_MODE_STOP;

    ros::init(argc, argv, "operation_modes");	
	ros::NodeHandle n;

    uint8_t option;

    client = n.serviceClient<controle::ChangeMode>("change_mode");

    if (client != nullptr) {	
        while (!isToStop) {
            option = menu();

            isToStop = (option == 99);

            if (!isToStop) {
                callService(option);
            }
        }
    }
    else {
        std::cout << "Service Client not found!";
    }

    return 0;
}