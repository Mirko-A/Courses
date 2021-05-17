#ifndef PARKING_HPP_INCLUDED
#define PARKING_HPP_INCLUDED

#include "dinstring.hpp"
#include "autobus.hpp"
#include "list.hpp"

class Parking {

private:

    DinString naziv;
    List<Autobus*> parkirani;

public:

    Parking (const DinString& pNaziv): naziv(pNaziv) {}

    bool uparkiraj(Autobus& autobus) {
        Autobus* pom;

        if(!autobus.voznoStanje())
            return false;

        for (int i=1; i<parkirani.size(); i++) {
            parkirani.read(i, pom);

            if(autobus.getRegbr() == pom->getRegbr())
                return false;
        }

        parkirani.add(parkirani.size()+1, &autobus);
        return true;
    }

    bool isparkiraj(const DinString& regBrZaVani) {
        Autobus* pom;

        for (int i=1; i<parkirani.size(); i++) {

            parkirani.read(i, pom);

            if(pom->getRegbr()==regBrZaVani) {
                parkirani.remove(i);
                return true;
            }
        }

        return false;
    }
};

#endif // PARKING_HPP_INCLUDED
