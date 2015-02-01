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
a=a(401:1200,601:1800);
b=Korrelation(binaer2,Muehlenstein);
b=b(401:1200,601:1800);
c=Korrelation(binaer3,Muehlenstein);
c=c(401:1200,601:1800);
d=Korrelation(binaer4,Muehlenstein);
d=d(401:1200,601:1800);
e=Korrelation(binaer5,Muehlenstein);
e=e(401:1200,601:1800);

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
ergebnis=zeros(1600,2400);
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
%Augenzahlentemplates erstellen

%1
domino1=dominoscharbinaer(458:489,392:425);
domino1=padarray(domino1,[384 583]);

%6
domino6=rotateImage(dominoscharbinaer(517:674,306:455),9,'linear');
domino6=domino6(23:132,27:136);
domino6=padarray(domino6,[345 545]);
domino6=TemplateList(domino6,'linear',1,0,179);

%5
domino5=rotateImage(dominoscharbinaer(50:385,390:709),122,'linear');
domino5=domino5(109:222,174:285);
domino5=padarray(domino5,[343 544]);
domino5=TemplateList(domino5,'linear',1,0,89);

%4
domino4=rotateImage(dominoscharbinaer(50:385,390:709),122,'linear');
domino4=domino4(111:220,174:283);
maxima=[56 57];
Length = size(domino4,1);
Width = size(domino4,2);
for m=1:2:size(maxima,2)
    for x=1:1:Length
        for y=1:1:Width
            if (x-maxima(m))^2 + (y-maxima(m+1))^2 < 20^2;
                domino4(x,y)=0;
            end
        end
    end
end
domino4=padarray(domino4,[345 545]);
domino4=TemplateList(domino4,'linear',0.5,0,89.5);

%3
template3=rotateImage(dominoscharbinaer(58:355,764:1020),117,'linear');
domino3=template3(87:202,14:125);
domino3=padarray(domino3,[342 544]);
domino3=TemplateList(domino3,'linear',1,0,179);

%2
template2=rotateImage(dominoscharbinaer(451:641,520:711),44,'linear');
domino2=template2(40:149,54:163);
domino2=padarray(domino2,[345 545]);
domino2=TemplateList(domino2,'linear',1,0,179);

%%
%Augenzahlen zählen

% templateaugen=Reduzieren(Korrelation(domino1,dominoscharbinaer),190);
ergebnis=zeros(1600,2400);
for w=1:1:180
    korr=Korrelation(domino2{w},Anzahl3er{2});
    Length = size(korr,1);
    Width = size(korr,2);
    for x=1:1:Length;
        for y=1:1:Width;
            if korr(x,y)>1;
                ergebnis(x,y)=korr(x,y);
            end
        end
    end
end

%%
dominoscharbinaer2=dominoscharbinaer;
%6er
Anzahl6er=counterAugen(domino6,180,dominoscharbinaer2,700);
Anzahl6er{1}
%5er
Anzahl5er=counterAugen(domino5,90,Anzahl6er{2},620);
Anzahl5er{1}
%3er
Anzahl3er=counterAugen(domino3,180,Anzahl5er{2},355);
Anzahl3er{1}
%4er
Anzahl4er=counterAugen(domino4,180,Anzahl3er{2},335);
Anzahl4er{1}
%2er
Anzahl2er=counterAugen(domino2,180,Anzahl3er{2},340);
Anzahl2er{1}
%1er
Anzahl1er=counterAugen(domino1,1,Anzahl2er{2},355);
Anzahl1er{1}

