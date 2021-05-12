#ifndef VIDEO_HPP_INCLUDED
#define VIDEO_HPP_INCLUDED
#include "dinstring.hpp"

class Video {

private:

    DinString naziv, rezolucijaVidea;
    int trajanje;

public:

    Video(): naziv(""), rezolucijaVidea("1920x1080") {
        trajanje = 0;
    }

    Video(const DinString& pNaziv, const DinString& pRezolucija, int pTrajanje): naziv(pNaziv), rezolucijaVidea(pRezolucija) {
        trajanje = pTrajanje;
    }


    DinString getNaziv() {
        return naziv;
    }

    DinString getRezolucija() {
        return rezolucijaVidea;
    }

    int getTrajanje() {
        return trajanje;
    }

    void setNaziv(const DinString& pNaziv) {
        naziv = pNaziv;
    }

    void setRezolucija(const DinString& pRezolucija) {
        rezolucijaVidea = pRezolucija;
    }

    void setTrajanje(const int pTrajanje) {
        trajanje = pTrajanje;
    }

};

#endif // VIDEO_HPP_INCLUDED
