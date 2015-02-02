function [counter] = Counter2(Bild,grenze);

Length = size(Bild,1);
Width = size(Bild,2);
redBild = Reduzieren(Bild,grenze);

counter = 0;
for i=1:Length
    for j=1:Width
        if redBild(i,j)>0
            counter = counter+1;
            redBild(i-50:i+50, j-50:j+50) = 0;
        end
    end
end

end