#include <iostream>
#include "vozilo.hpp"
#include "autobus.hpp"
#include "parking.hpp"

using namespace std;

int Autobus::brojAutobusa=0;

int main()
{

    Autobus a1;
    Autobus a2("332519", TERETNO, 2001, 20);
    Autobus a3("362539", TERETNO, 2015, 25);

    cout<<a1;
    cout<<a2;
    cout<<a3;

    Parking p1("Miretov Parking");

    p1.uparkiraj(a1);
    p1.uparkiraj(a2);
    p1.uparkiraj(a3);

    p1.isparkiraj("362539");


    cout << "Hello world!" << endl;
    return 0;
}
