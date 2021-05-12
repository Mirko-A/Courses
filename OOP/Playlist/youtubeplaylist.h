#ifndef YOUTUBEPLAYLIST_H_INCLUDED
#define YOUTUBEPLAYLIST_H_INCLUDED
#include "videolist.hpp"

class YoutubePlaylist: public VideoList {

private:

    DinString nazivPlayliste;
    DinString nazivAutora;

public:

    YoutubePlaylist(): VideoList(), nazivPlayliste(""), nazivAutora("") {}

    YoutubePlaylist(const DinString& pNazivPlayliste, const DinString& pNazivAutora): VideoList(), nazivPlayliste(pNazivPlayliste), nazivAutora(pNazivAutora) {}

    int najduziVideo() const {

        if(listaVidea.empty()){
            return -1;
        }

        int najduziVidPoz = 1;
        Video pom;
        Video najduzi;


        for (int i=2; i<=listaVidea.size()+1; i++){
            listaVidea.read(najduziVidPoz, najduzi);
            listaVidea.read(i, pom);
            if(najduzi.getTrajanje() < pom.getTrajanje()) {
                najduziVidPoz = i;
            }
        }

        return najduziVidPoz;
     }

    int prosecnoTrajanje() const {
        int ukupnoTrajanje, prosecnoTrajanje;
        Video pom;

        for(int i=1; i<=listaVidea.size(); i++) {
            listaVidea.read(i, pom);
            ukupnoTrajanje += pom.getTrajanje();
           }
        prosecnoTrajanje = ukupnoTrajanje/listaVidea.size();

        return prosecnoTrajanje;
    }

    friend ostream& operator<<(ostream& out, const YoutubePlaylist& pPlaylist) {
         int prosecnoTrajanjeVidea = pPlaylist.prosecnoTrajanje();
         Video pom;

         out<<"Ovaj video je duzi od prosecne duzine: ";
         for (int i=1; i<=pPlaylist.listaVidea.size(); i++) {
            pPlaylist.listaVidea.read(i, pom);
            if(pom.getTrajanje() > prosecnoTrajanjeVidea) {
                out<<pom.getNaziv()<<"; ";
            }
         }
         out<<endl;

         pPlaylist.listaVidea.read(pPlaylist.najduziVideo(), pom);
         out<<"Najduzi video u listi je: "<<pom.getNaziv()<<endl;
         return out;
    };
};

#endif // YOUTUBEPLAYLIST_H_INCLUDED
