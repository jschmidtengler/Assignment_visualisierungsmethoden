function [counter] = Counter(Bild,grenze);

Length = size(Bild,1);
Width = size(Bild,2);
redBild = DominoDelete(Reduzieren(Bild,grenze));

counter = 0;
for i=1:Length
    for j=1:Width
        if redBild(i,j)>0
            counter = counter+1;
            redBild(i-20:i+60, j-20:j+60) = 0;
        end
    end
end

end
