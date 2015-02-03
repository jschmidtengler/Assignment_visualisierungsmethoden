%Dateien einlesen und Binärisieren

Bild1 = imread('./templates/DominoMuehle1.JPG');
Bild2 = imread('./templates/DominoMuehle2.JPG');
Bild3 = imread('./templates/DominoMuehle3.JPG');
Bild4 = imread('./templates/DominoMuehle4.JPG');
Bild5 = imread('./templates/DominoMuehle5.JPG');

binaer1 = Binarisierung(Bild1,55);
binaer2 = Binarisierung(Bild2,50);
binaer3 = Binarisierung(Bild3,45);
binaer4 = Binarisierung(Bild4,55);
binaer5 = Binarisierung(Bild5,60);
%%
%Mühlestein erstellen
% Muehlenstein=ones(800,1200);
% for x=1:1:800
%     for y=1:1:1200
%         if (x-400)^2 + (y-600)^2 >= 66^2;
%             Muehlenstein(x,y)=0;
%         end
%    end
% end
load('./templates/muehlenstein.mat');
%%
%Mühlestein korrelieren und zählen.
a=Korrelation(binaer1,Muehlenstein);
figure('position', [50, 50, 1400, 700])
imagesc(a);
pause(0.01);
b=Korrelation(binaer2,Muehlenstein);
imagesc(b);
pause(0.01);
c=Korrelation(binaer3,Muehlenstein);
imagesc(c);
pause(0.01);
d=Korrelation(binaer4,Muehlenstein);
imagesc(d);
pause(0.01);
e=Korrelation(binaer5,Muehlenstein);
imagesc(d);
pause(0.01);

MuehlesteineBild1=Counter(a,12800)
MuehlesteineBild2=Counter(b,12800)
MuehlesteineBild3=Counter(c,12800)
MuehlesteineBild4=Counter(d,12800)
MuehlesteineBild5=Counter(e,12800)
%%
%Dominotemplate erstellen
%do not touch!!! template!!
% dominoscharbinaer = Binarisierung2(Grad2(cutMuehle(b,binaer2)),1);
% dominosteinklein = dominoscharbinaer(50:385,390:709);
% maxima=[175,115,216,178,228,127,239,75,280,138];
% Length = size(dominosteinklein,1);
% Width = size(dominosteinklein,2);
% for m=1:2:size(maxima,2)
%     for x=1:1:Length
%         for y=1:1:Width
%             if (x-maxima(m))^2 + (y-maxima(m+1))^2 < 18^2;
%                 dominosteinklein(x,y)=0;
%             end
%         end
%     end
% end
% dominotemp=padarray(dominosteinklein,[232 440]);
% %Dominostein in allen Orientierungen erstellen.
% dominosteineAlleWinkel=TemplateList(dominotemp,'linear',2,0,178);
load('./templates/dominosteineallewinkel');
%%
%Dominosteine korrelieren und zählen.
dominotest = Binarisierung2(Grad2(cutMuehle(a,binaer1)),1);
ergebnis=zeros(800,1200);
for w=1:1:90
    korr=Korrelation(dominosteineAlleWinkel{w},dominotest);
    Length = size(korr,1);
    Width = size(korr,2);
    subplot(1,2,1);
    imagesc(dominosteineAlleWinkel{w});
    title('Current dominotemplate orientation');
    pause(0.01);
    for x=1:1:Length;
        for y=1:1:Width;
            if korr(x,y)>1700;
                ergebnis(x,y)=korr(x,y);
                subplot(1,2,2);
                imagesc(ergebnis);
                title('Sum of correlation');
                pause(0.0001);
            end
        end
    end
end
ergebnis=ergebnis./(max(max(ergebnis)));
ergebnis2=Reduzieren(ergebnis,0.75);

Length = size(ergebnis,1);
Width = size(ergebnis,2);
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
% hilfsmatrix=zeros(800,1200);
% kleinerkreis=ones(29);
% for x=1:29
%     for y=1:29
%          
%         if (x-15)^2+(y-15)^2>=14^2;
%             kleinerkreis(x,y)=0;
%               %Testweise auf 8, normalwert 14
%         end
%     end
%    
% end
% 
% %sechs
% sechs=zeros(126,126);
% 
% sechs(12:40,12:40)=kleinerkreis;
% sechs(49:77,12:40)=kleinerkreis;
% sechs(87:115,12:40)=kleinerkreis;
% sechs(12:40,87:115)=kleinerkreis;
% sechs(49:77,87:115)=kleinerkreis;
% sechs(87:115,87:115)=kleinerkreis;
% sechs2=hilfsmatrix;
% sechs2(338:463,538:663)=sechs;
% domino6=TemplateList(sechs2,'linear',5,0,175);
% %fünf
% fuenf=zeros(126,126);
% 
% fuenf(12:40,12:40)=kleinerkreis;
% fuenf(12:40,87:115)=kleinerkreis;
% fuenf(87:115,12:40)=kleinerkreis;
% fuenf(87:115,87:115)=kleinerkreis;
% fuenf(49:77,49:77)=kleinerkreis;
% fuenf2=hilfsmatrix;
% fuenf2(338:463,538:663)=fuenf;
% domino5=TemplateList(fuenf2,'linear',5,0,85);
% 
% %vier
% vier=zeros(126,126);
% 
% vier(12:40,12:40)=kleinerkreis;
% vier(12:40,87:115)=kleinerkreis;
% vier(87:115,12:40)=kleinerkreis;
% vier(87:115,87:115)=kleinerkreis;
% vier2=hilfsmatrix;
% vier2(338:463,538:663)=vier;
% domino4=TemplateList(vier2,'linear',5,0,85);
% 
% %drei
% drei=zeros(126,126);
% 
% drei(12:40,12:40)=kleinerkreis;
% drei(49:77,49:77)=kleinerkreis;
% drei(87:115,87:115)=kleinerkreis;
% drei2=hilfsmatrix;
% drei2(338:463,538:663)=drei;
% domino3=TemplateList(drei2,'linear',5,0,175);
% 
% %zwei
% zwei=zeros(126,126);
% zwei(12:40,12:40)=kleinerkreis;
% zwei(87:115,87:115)=kleinerkreis;
% zwei2=hilfsmatrix;
% zwei2(338:463,538:663)=zwei;
% domino2=TemplateList(zwei2,'linear',5,0,175);

% %eins
% eins=zeros(800,1200);
% eins(386:414,586:614)=kleinerkreis;
% domino1=Binarisierung2(Grad2(eins),1);
load('./templates/domino1');
load('./templates/domino2');
load('./templates/domino3');
load('./templates/domino4');
load('./templates/domino5');
load('./templates/domino6');
%%
%Augenzahlen zählen
maske=ones(5,5);
augentest=double(dilatation(maske,erosion(maske,binaer5)));
augentest = Grad2(cutMuehle(e,augentest));
maske2=ones(2,2);
augentest2=dilatation(maske,Reduzieren(Korrelation(domino1,augentest),280));
subplot(1,2,1);
imagesc(flipdim(flipdim(augentest2 ,1),2));
title('Template complete');
%5er
Anzahl5er=zeros(800,1200);
for w=1:1:18
    korr=Korrelation(domino5{w},augentest2);
    Anzahl5er=korr+Anzahl5er;
    subplot(1,2,2);
    imagesc(Anzahl5er);
    title('Sum of correlation 5');
    pause(0.007);
end
Anzahl5er=flipdim(flipdim(Anzahl5er ,1),2);
Anzahl5=Counter2(Anzahl5er./(max(max(Anzahl5er))),0.98);
templateCount6=cutAugen(Reduzieren(Anzahl5er./(max(max(Anzahl5er))),0.97),augentest2);
subplot(1,2,1);
imagesc(flipdim(flipdim(templateCount6 ,1),2));
title('Template -5');
%6er
Anzahl6er=zeros(800,1200);
for w=1:1:36
    korr=Korrelation(domino6{w},templateCount6);
    Anzahl6er=korr+Anzahl6er;
    subplot(1,2,2);
    imagesc(Anzahl6er);
    title('Sum of correlation 6');
    pause(0.007);
end
Anzahl6er=flipdim(flipdim(Anzahl6er ,1),2);
Anzahl6=Counter2(Anzahl6er./(max(max(Anzahl6er))),0.9)
templateCount3=cutAugen(Reduzieren(Anzahl6er./(max(max(Anzahl6er))),0.9),templateCount6);
subplot(1,2,1);
imagesc(flipdim(flipdim(templateCount3 ,1),2));
title('Template -5,6');
Anzahl5
%3er
Anzahl3er=zeros(800,1200);
for w=1:1:36
    korr=Korrelation(domino3{w},templateCount3);
    Anzahl3er=korr+Anzahl3er;
    subplot(1,2,2);
    imagesc(Anzahl3er);
    title('Sum of correlation 3');
    pause(0.01);
end
Anzahl3er=flipdim(flipdim(Anzahl3er ,1),2);
Anzahl3=Counter2(Anzahl3er./(max(max(Anzahl3er))),0.94)
templateCount4=cutAugen(Reduzieren(Anzahl3er./(max(max(Anzahl3er))),0.94),templateCount3);
subplot(1,2,1);
imagesc(flipdim(flipdim(templateCount4 ,1),2));
title('Template -3,5,6');
%4er
Anzahl4er=zeros(800,1200);
for w=1:1:18
    korr=Korrelation(domino4{w},templateCount4);
    Anzahl4er=korr+Anzahl4er;
    subplot(1,2,2);
    imagesc(Anzahl4er);
    title('Sum of correlation 4');
    pause(0.007);
end
Anzahl4er=flipdim(flipdim(Anzahl4er ,1),2);
Anzahl4=Counter2(Anzahl4er./(max(max(Anzahl4er))),0.97)
templateCount2=cutAugen(Reduzieren(Anzahl4er./(max(max(Anzahl4er))),0.97),templateCount4);
subplot(1,2,1);
imagesc(flipdim(flipdim(templateCount2 ,1),2));
title('Template -3,4,5,6');
%2er
Anzahl2er=zeros(800,1200);
for w=1:1:36
    korr=Korrelation(domino2{w},templateCount2);
    Anzahl2er=korr+Anzahl2er;
    subplot(1,2,2);
    imagesc(Anzahl2er);
    title('Sum of correlation 2');
    pause(0.01);
end
Anzahl2er=flipdim(flipdim(Anzahl2er ,1),2);
Anzahl2=Counter2(Anzahl2er./(max(max(Anzahl2er))),0.93)
templateCount1=cutAugen(Reduzieren(Anzahl2er./(max(max(Anzahl2er))),0.93),templateCount2);
subplot(1,2,1);
imagesc(flipdim(flipdim(templateCount1 ,1),2));
title('Template -2,3,4,5,6')
%1er
Anzahl1er=zeros(800,1200);
Anzahl1er=Korrelation(domino1,templateCount1);
subplot(1,2,2);
imagesc(Anzahl1er);
title('Sum of correlation 1');
pause(0.01);
Anzahl1er=flipdim(flipdim(Anzahl2er ,1),2);
Anzahl1=Counter2(Anzahl1er./(max(max(Anzahl1er))),0.95)
close all