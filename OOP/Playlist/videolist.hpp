#ifndef VIDEOLIST_HPP_INCLUDED
#define VIDEOLIST_HPP_INCLUDED
#include "video.hpp"
#include "list.hpp"

class VideoList {

protected:

    List<Video> listaVidea;

public:

    VideoList(): listaVidea() {}

    bool dodajVideo(Video& pVideo) {
        Video pom;

        for (int i=1; i<=listaVidea.size(); i++){
            listaVidea.read(i, pom);
            if (pom.getNaziv()==pVideo.getNaziv()) {
                return false;
            }
        }

        listaVidea.add(listaVidea.size()+1, pVideo);
        return true;
    }

    bool obrisiVideo(const DinString& videoZaBrisanje){
        Video pom;

        for (int i=1; i<=listaVidea.size(); i++){
            listaVidea.read(i, pom);
            if (pom.getNaziv()==videoZaBrisanje) {
                listaVidea.remove(i);
                return true;
            }
        }

        return false;
    }



    List<Video> getVideoList() {
        return listaVidea;
    }

};

#endif // VIDEOLIST_HPP_INCLUDED
