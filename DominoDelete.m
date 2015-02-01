function [AusBild] = DominoDelete(Bild)


Length = size(Bild,1);
Width = size(Bild,2);
AusBild = Binarisierung2(Bild,1);

for i=1:50:Length-99
    for j=1:50:Width-99
        Ausschnitt = AusBild(i:i+99, j:j+99);
        if sum(sum(Ausschnitt))>280;
            AusBild(i:i+150, j:j+150) = 0;
        end
    end
end

AusBild = AusBild .* Bild;

end
            