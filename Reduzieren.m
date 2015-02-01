function [redBild] = Reduzieren(Bild,threshold);

Length = size(Bild,1);
Width = size(Bild,2);
redBild = Bild;

for i=1:Length
  for  j=1:Width
    if Bild(i,j)<threshold;
        redBild(i,j)=0;
    end
  end
end

% Max = max(max(redBild));
% Solve(redBild(x,y)==Max,x,y)
% 
% redBild(KoordMax(1)-20:KoordMax(1)+20, KoordMax(2)-20:KoordMax(2)+20) = 0;

end
