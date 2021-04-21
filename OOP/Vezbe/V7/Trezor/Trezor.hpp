#ifndef TREZOR_HPP_INCLUDED
#define TREZOR_HPP_INCLUDED


template <class SADRZAJ, int KAPACITET>
class Trezor {

private:

    SADRZAJ sefovi[KAPACITET];
    bool popunjeno[KAPACITET];

public:

    Trezor() {
        for(int i = 0; i < KAPACITET; i++) {
            popunjeno[i] = false;
        }
    }

    int getBrojPopunjenihSefova() {
        int brojPopunjenihSefova = 0;
        for(int i = 0; i < KAPACITET; i++) {
            if(popunjeno[i]) {
                brojPopunjenihSefova++;
            }
        }
        return brojPopunjenihSefova;
    }

    int ubaciSadrzaj(const SADRZAJ& predmet) {
        for(int i = 0; i < KAPACITET; i++) {
            if(!popunjeno[i]) {
                sefovi[i] = predmet;
                popunjeno[i] = true;
                return i+1;
            }
        }
         return -1;
    }

    bool izbaciSadrzaj(int sef) {
        if(popunjeno[sef]) {
            popunjeno[sef] = false;
            return true;
        } else {
            return false;
           }
    }
};

#endif // TREZOR_HPP_INCLUDED
