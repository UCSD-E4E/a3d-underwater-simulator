#include <iostream>

#include "gpu/optix.hpp"

using namespace std;

int main(int argc, char* argv[]) {
    initializeOptix();

    cout << "Hello, World!" << endl;
}