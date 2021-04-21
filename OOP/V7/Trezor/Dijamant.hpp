#ifndef DIJAMANT_HPP_INCLUDED
#define DIJAMANT_HPP_INCLUDED
#include <iostream>

using namespace std;

class Dijamant {

private:

    double vrednost;
    double brojKarata;

public:

    Dijamant (){
        vrednost = 1000;
        brojKarata = 10;
    }

    Dijamant (double pVrednost, double pBrojKarata) {
        vrednost = pVrednost;
        brojKarata = pBrojKarata;
    }

    Dijamant (const Dijamant& pDijamant): vrednost(pDijamant.vrednost), brojKarata(pDijamant.brojKarata){}

    double getVrednost() {
        return vrednost;
    }

    void setVrednost(double novaVrednost) {
        vrednost = novaVrednost;
    }

    double getBrojKarata() {
        return brojKarata;
    }


    void setBrojKarata(double noviBrojKarata) {
        brojKarata = noviBrojKarata;
    }


    friend ostream& operator<<(ostream& os, const Dijamant& d){

    os << "Ovaj dijamant ima "<< d.brojKarata<<" karata i njegova vrednost je " << d.vrednost << " dinara." << endl;

    return os;
    }

};

#endif // DIJAMANT_HPP_INCLUDED
