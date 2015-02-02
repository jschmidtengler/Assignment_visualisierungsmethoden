%Dateien einlesen und Binärisieren

Bild1 = imread('DominoMuehle1.JPG');
Bild2 = imread('DominoMuehle2.JPG');
Bild3 = imread('DominoMuehle3.JPG');
Bild4 = imread('DominoMuehle4.JPG');
Bild5 = imread('DominoMuehle5.JPG');

binaer1 = Binarisierung(Bild1,55);
binaer2 = Binarisierung(Bild2,50);
binaer3 = Binarisierung(Bild3,45);
binaer4 = Binarisierung(Bild4,55);
binaer5 = Binarisierung(Bild5,60);
%%
%Mühlestein erstellen

Muehle=ones(800,1200);

for x=1:1:800
    for y=1:1:1200
        if (x-400)^2 + (y-600)^2 >= 66^2;
            Muehle(x,y)=0;
        end
   end
end

Muehlenstein=Muehle;
%%
%Mühlestein korrelieren und zählen

a=Korrelation(binaer1,Muehlenstein);
% a=a(401:1200,601:1800);
b=Korrelation(binaer2,Muehlenstein);
% b=b(401:1200,601:1800);
c=Korrelation(binaer3,Muehlenstein);
% c=c(401:1200,601:1800);
d=Korrelation(binaer4,Muehlenstein);
% d=d(401:1200,601:1800);
e=Korrelation(binaer5,Muehlenstein);
% e=e(401:1200,601:1800);

MuehlesteineBild1=Counter(a,12800)
MuehlesteineBild2=Counter(b,12800)
MuehlesteineBild3=Counter(c,12800)
MuehlesteineBild4=Counter(d,12800)
MuehlesteineBild5=Counter(e,12800)
%%
%Dominotemplate erstellen

dominoscharbinaer = Binarisierung2(Grad2(cutMuehle(b,binaer2)),1);
dominosteinklein = dominoscharbinaer(50:385,390:709);
maxima=[175,115,216,178,228,127,239,75,280,138];
Length = size(dominosteinklein,1);
Width = size(dominosteinklein,2);
for m=1:2:size(maxima,2)
    for x=1:1:Length
        for y=1:1:Width
            if (x-maxima(m))^2 + (y-maxima(m+1))^2 < 18^2;
                dominosteinklein(x,y)=0;
            end
        end
    end
end
dominotemp=padarray(dominosteinklein,[232 440]);
%%
%Dominostein in allen Orientierungen erstellen und Korrelieren.

dominosteineAlleWinkel=TemplateList(dominotemp,'linear',1,0,179);
ergebnis=zeros(800,1200);
for w=1:1:180
    korr=Korrelation(dominosteineAlleWinkel{w},dominoscharbinaer);
    Length = size(korr,1);
    Width = size(korr,2);
    for x=1:1:Length;
        for y=1:1:Width;
            if korr(x,y)>1850;
                ergebnis(x,y)=korr(x,y);
            end
        end
    end
end
%%
%Dominosteine zählen

Length = size(ergebnis,1);
Width = size(ergebnis,2);
ergebnis2=ergebnis;
AnzahlDominosteine = 0;
for i=1:Length;
    for j=1:Width;
        if ergebnis2(i,j)>0;
            AnzahlDominosteine = AnzahlDominosteine+1;
            ergebnis2(i-20:i+60, j-20:j+60) = 0;
        end
    end
end
AnzahlDominosteine
%%
%Augenzahlentemplates mit artificial dominos
hilfsmatrix=zeros(800,1200);
kleinerkreis=ones(29);
for x=1:29
    for y=1:29
         
        if (x-15)^2+(y-15)^2>=8^2;
            kleinerkreis(x,y)=0;
        end
    end
   
end

%sechs
sechs=zeros(126,126);

sechs(12:40,12:40)=kleinerkreis;
sechs(49:77,12:40)=kleinerkreis;
sechs(87:115,12:40)=kleinerkreis;
sechs(12:40,87:115)=kleinerkreis;
sechs(49:77,87:115)=kleinerkreis;
sechs(87:115,87:115)=kleinerkreis;
sechs2=hilfsmatrix;
sechs2(338:463,538:663)=sechs;
domino6=TemplateList(sechs2,'linear',5,0,175);
%fünf
fuenf=zeros(126,126);

fuenf(12:40,12:40)=kleinerkreis;
fuenf(12:40,87:115)=kleinerkreis;
fuenf(87:115,12:40)=kleinerkreis;
fuenf(87:115,87:115)=kleinerkreis;
fuenf(49:77,49:77)=kleinerkreis;
fuenf2=hilfsmatrix;
fuenf2(338:463,538:663)=fuenf;
domino5=TemplateList(fuenf2,'linear',5,0,85);

%vier
vier=zeros(126,126);

vier(12:40,12:40)=kleinerkreis;
vier(12:40,87:115)=kleinerkreis;
vier(87:115,12:40)=kleinerkreis;
vier(87:115,87:115)=kleinerkreis;
vier2=hilfsmatrix;
vier2(338:463,538:663)=vier;
domino4=TemplateList(vier2,'linear',5,0,85);

%drei
drei=zeros(126,126);

drei(12:40,12:40)=kleinerkreis;
drei(49:77,49:77)=kleinerkreis;
drei(87:115,87:115)=kleinerkreis;
drei2=hilfsmatrix;
drei2(338:463,538:663)=drei;
domino3=TemplateList(drei2,'linear',5,0,175);

%zwei
zwei=zeros(126,126);
zwei(12:40,12:40)=kleinerkreis;
zwei(87:115,87:115)=kleinerkreis;
zwei2=hilfsmatrix;
zwei2(338:463,538:663)=zwei;
domino2=TemplateList(zwei2,'linear',1,0,179);

%eins
eins=zeros(800,1200);
kleinerkreis2=ones(29);
for x=1:29
    for y=1:29
         
        if (x-15)^2+(y-15)^2>=14^2;
            kleinerkreis2(x,y)=0;
        end
    end
   
end
eins(386:414,586:614)=kleinerkreis2;
domino1=Binarisierung2(Grad2(eins),1);

%%
%Augenzahlen zählen

dominoscharbinaer2=Reduzieren(Korrelation(domino1,dominoscharbinaer),200);
%6er
Anzahl6er=zeros(800,1200);
for w=1:1:36
    korr=Korrelation(domino6{w},dominoscharbinaer2);
    Anzahl6er=korr+Anzahl6er;
end
Anzahl6er=flipdim(flipdim(Anzahl6er ,1),2);
Anzahl6=Counter2(Anzahl6er./(max(max(Anzahl6er))),0.9);
templateCount5=cutAugen(Reduzieren(Anzahl6er./(max(max(Anzahl6er))),0.9),dominoscharbinaer2);
%5er
Anzahl5er=zeros(800,1200);
for w=1:1:18
    korr=Korrelation(domino5{w},templateCount5);
    Anzahl5er=korr+Anzahl5er;
end
Anzahl5er=flipdim(flipdim(Anzahl5er ,1),2);
Anzahl5=Counter2(Anzahl5er./(max(max(Anzahl5er))),0.9);
templateCount4=cutAugen(Reduzieren(Anzahl5er./(max(max(Anzahl5er))),0.9),templateCount5);
%4er
Anzahl4er=zeros(800,1200);
for w=1:1:18
    korr=Korrelation(domino4{w},templateCount4);
    Anzahl4er=korr+Anzahl4er;
end
Anzahl4er=flipdim(flipdim(Anzahl4er ,1),2);
Anzahl4=Counter2(Anzahl4er./(max(max(Anzahl4er))),0.9);
templateCount3=cutAugen(Reduzieren(Anzahl4er./(max(max(Anzahl4er))),0.9),templateCount4);
%3er
Anzahl3er=zeros(800,1200);
for w=1:1:36
    korr=Korrelation(domino3{w},templateCount3);
    Anzahl3er=korr+Anzahl3er;
end
Anzahl3er=flipdim(flipdim(Anzahl3er ,1),2);
Anzahl3=Counter2(Anzahl3er./(max(max(Anzahl3er))),0.97);
templateCount2=cutAugen(Reduzieren(Anzahl3er./(max(max(Anzahl3er))),0.97),templateCount3);
%2er
Anzahl2er=zeros(800,1200);
for w=1:1:36
    korr=Korrelation(domino2{w},templateCount2);
    Anzahl2er=korr+Anzahl2er;
end
Anzahl2er=flipdim(flipdim(Anzahl2er ,1),2);
Anzahl2=Counter2(Anzahl2er./(max(max(Anzahl2er))),0.95);
templateCount1=cutAugen(Reduzieren(Anzahl2er./(max(max(Anzahl2er))),0.95),templateCount2);
%1er
Anzahl1er=zeros(800,1200);
Anzahl1er=Korrelation(domino1,templateCount1);
Anzahl1er=flipdim(flipdim(Anzahl2er ,1),2);
Anzahl1=Counter2(Anzahl1er./(max(max(Anzahl1er))),0.95);