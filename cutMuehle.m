function [binaerbild] = cutMuehle(Bild,BinaerBild);

Length = size(Bild,1);
Width = size(Bild,2);
Maxima = SearchMax(DominoDelete(Reduzieren(Bild,12800)));
binaerbild = BinaerBild;

for m=1:2:size(Maxima,2)
    for x=1:1:Length
        for y=1:1:Width
            if (x-Maxima(m))^2 + (y-Maxima(m+1))^2 < 68^2;
                binaerbild(x,y)=0;
            end
        end
    end
end

end