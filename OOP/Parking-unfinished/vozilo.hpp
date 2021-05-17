#ifndef VOZILO_HPP_INCLUDED
#define VOZILO_HPP_INCLUDED
#include "dinstring.hpp"

enum VrstaVozila {LAKO, MOTORNO, TERETNO, PRIKLJUCNO};

class Vozilo {

protected:

    DinString regbr;
    VrstaVozila vrsta;
    int godiste;

public:

    Vozilo(): regbr(""){
       vrsta = LAKO;
       godiste = 2000;
    }

    Vozilo(const DinString& pRegbr, VrstaVozila pVrsta, int pGodiste): regbr(pRegbr) {
        vrsta = pVrsta;
        godiste = pGodiste;
    }

    DinString getRegbr() const {
        return regbr;
    }

    VrstaVozila getVrsta() const {
        return vrsta;
    }

    int getGodiste() const {
        return godiste;
    }

    void setRegbr(const DinString& pRegbr){
        regbr = pRegbr;
    }

    void setVrsta (VrstaVozila pVrsta) {
        vrsta = pVrsta;
    }

    void setGodiste(int pGodiste) {
        godiste = pGodiste;
    }

    virtual bool voznoStanje()=0;
};

#endif // VOZILO_HPP_INCLUDED
