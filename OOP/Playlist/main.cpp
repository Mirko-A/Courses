#include <iostream>
#include "video.hpp"
#include "videolist.hpp"
#include "youtubeplaylist.h"

using namespace std;

int main()
{
    Video v1;
    Video v2("dog fail vid", "1280x720", 15);
    Video v3("kratak video", "1280x720", 3);
    Video v4("film", "1920x1080", 100);
    Video v5("my first vlog", "1280x720", 30);
    Video v6("test drive yamaha r6", "1280x720", 10);
    VideoList vList1;

    cout<<"Naziv: "<<v1.getNaziv()<<endl<<"Rezolucija: "<<v1.getRezolucija()<<endl<<"Trajanje: "<<v1.getTrajanje()<<endl<<endl;

    v1.setNaziv("Cat fail vid");
    v1.setRezolucija("800x600");
    v1.setTrajanje(10);

    cout<<"Naziv: "<<v1.getNaziv()<<endl<<"Rezolucija: "<<v1.getRezolucija()<<endl<<"Trajanje: "<<v1.getTrajanje()<<endl<<endl;

    cout<<"Naziv: "<<v2.getNaziv()<<endl<<"Rezolucija: "<<v2.getRezolucija()<<endl<<"Trajanje: "<<v2.getTrajanje()<<endl<<endl;

    vList1.dodajVideo(v1);

    Video readTestVideo;

    vList1.getVideoList().read(1, readTestVideo);

    cout<<"Naziv: "<<readTestVideo.getNaziv()<<endl<<"Rezolucija: "<<readTestVideo.getRezolucija()<<endl<<"Trajanje: "<<readTestVideo.getTrajanje()<<endl<<endl;

    if(vList1.obrisiVideo("Cat fail vid")) {
        cout<<"Video obrisan."<<endl;
    } else {
        cout<<"Video sa datim nazivom ne postoji."<<endl;
    }

    if (vList1.getVideoList().read(1, readTestVideo)) {
        cout<<"Naziv: "<<readTestVideo.getNaziv()<<endl<<"Rezolucija: "<<readTestVideo.getRezolucija()<<endl<<"Trajanje: "<<readTestVideo.getTrajanje()<<endl<<endl;
    }

    YoutubePlaylist yt1;
    yt1.dodajVideo(v1);
    yt1.dodajVideo(v2);
    yt1.dodajVideo(readTestVideo);
    yt1.dodajVideo(v3);
    yt1.dodajVideo(v4);
    yt1.dodajVideo(v5);
    yt1.dodajVideo(v6);


    Video najduzi;

    yt1.getVideoList().read(yt1.najduziVideo(), najduzi);

    cout<<"Najduzi video je: "<<najduzi.getNaziv()<<endl;

    cout<<yt1<<endl;

    cout<<"Prosecno trajanje: "<<yt1.prosecnoTrajanje()<<endl;

    cout << "Hello world!" << endl;
    return 0;
}
