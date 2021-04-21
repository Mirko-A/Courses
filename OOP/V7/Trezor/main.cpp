#include <iostream>
#include "Trezor.hpp"
#include "Dijamant.hpp"

using namespace std;

int main()
{
    Trezor<Dijamant, 50> t1;

    Dijamant d1;
    Dijamant d2;
    Dijamant d3;
    Dijamant d4;
    Dijamant d5;
    Dijamant d6;
    Dijamant d7;
    cout << t1.ubaciSadrzaj(d1) << endl;
    cout << t1.ubaciSadrzaj(d2) << endl;
    cout << t1.ubaciSadrzaj(d3) << endl;
    cout << t1.ubaciSadrzaj(d4) << endl;
    cout << t1.ubaciSadrzaj(d5) << endl;

    if(t1.izbaciSadrzaj(2)) {
        cout << "izbaceno" << endl;
    }

    cout << t1.ubaciSadrzaj(d6) << endl;
    cout << t1.ubaciSadrzaj(d7) << endl;




    cout << t1.getBrojPopunjenihSefova()<< endl;

    cout << d1;

    cout << "Hello world!" << endl;
    return 0;
}
