function [counter] = Counter2(Bild,grenze);

Length = size(Bild,1);
Width = size(Bild,2);
redBild = Reduzieren(Bild,grenze);

counter = 0;
for i=1:Length
    for j=1:Width
        if redBild(i,j)>0
            counter = counter+1;
            redBild(i-80:i+80, j-80:j+80) = 0;
        end
    end
end

end