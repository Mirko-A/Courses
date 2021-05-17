#ifndef AUTOBUS_HPP_INCLUDED
#define AUTOBUS_HPP_INCLUDED
#include "vozilo.hpp"

class Autobus: public Vozilo {

private:

    int brojMesta;
    static int brojAutobusa;

public:

    Autobus(): Vozilo() {
        brojMesta = 10;
        brojAutobusa++;
    }

    Autobus(const DinString& pRegbr, VrstaVozila pVrsta, int pGodiste, int pBrojMesta): Vozilo(pRegbr, pVrsta, pGodiste) {
        brojMesta = pBrojMesta;
        brojAutobusa++;
    }

    ~Autobus() {
        brojAutobusa--;
    }

    int getBrojMesta() const {
        return brojMesta;
    }

    bool voznoStanje() {
        if(godiste>2000) {
            return true;
        } else
        return false;
    }

    DinString ispisiVrstu() const {
        switch(vrsta) {
        case LAKO:
            return "LAKO";
        case MOTORNO:
            return "MOTORNO";
        case TERETNO:
            return "TERETNO";
        case PRIKLJUCNO:
            return "PRIKLJUCNO";
        }
    }

    friend ostream& operator<<(ostream& out, Autobus& autobus) {
        out<<"----- PODACI O VOZILU -----"<<endl<<endl;
        out<<"Registarski broj: "<<autobus.getRegbr()<<endl;
        out<<"Vrsta vozila: "<<autobus.ispisiVrstu()<<endl;
        out<<"Godina proizvodnje: "<<autobus.getGodiste()<<endl;
        out<<"Broj mesta u vozilu: "<<autobus.getBrojMesta()<<endl;
        if(autobus.voznoStanje()) {
            out<<"U voznom stanju."<<endl<<endl;
        } else {
            out<<"Nije u voznom stanju."<<endl<<endl;
        }
    }
};

#endif // AUTOBUS_HPP_INCLUDED
