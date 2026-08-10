#include <bitset>
#include "core/core.h"

int main(int argc, char* argv[]) {
    ///*
    std::thread windowThread(window_thread);

    std::cout << "Started window thread\n";

    char input = '0';
    while (input != 'Y' && input != 'y') {
        
        std::print("\x1b[2KSimulating work in the main thread...\r");
        std::this_thread::sleep_for(std::chrono::seconds(1));
        
        std::cout << "\x1b[2K" << "Do you want to exit? [y|N]\n"
                << ": \x1b[?25h" << "\x1b[?12h";
        input = 'y'; //*/
        std::cin.get(input);
        if (input != '\n') {
            std::cin.ignore(std::numeric_limits<std::streamsize>::max(), '\n');
        }
        //*/
        if (input == 'Y' || input == 'y') {
            std::cout << "\x1b[A\x1b[2K\r" << "Exiting main thread...\n";
            break;
        }
        std::cout << "\x1b[A\x1b[2K\x1b[A";
    }

    windowThread.join();

    std::cout << "Exiting window thread\n";
    //*/

    return 0;
}