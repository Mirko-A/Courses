#include <iostream>
#include <cmath>

using namespace std;

int main()
{
    int n;
    double vrednosti[n];
    double vrednost, sr_vrednost, devijacija;
    double suma = 0;

    cout << "Unesite broj vrednosti: ";
    cin >> n;


    for(int i=0; i<n; i++) {

    cout << endl << "Unesite vrednost broj " << i+1 << ": ";
    cin >> vrednost;
    vrednosti[i] = vrednost;
    suma += vrednost;

    }

    sr_vrednost = suma/n;

    cout << "Srednja vrednost: " << sr_vrednost << endl;

    devijacija = 0;

    for (int i=0; i<n; i++) {

        devijacija += pow((vrednosti[i]-sr_vrednost), 2);

    }

    devijacija = sqrt(devijacija/(n-1));

    cout << "Devijacija: " << devijacija << endl << endl;

    return 0;
}
