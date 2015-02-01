function pixel = GetPixelLinear(image, x, y)
    s1 = size(image,1);
    s2 = size(image,2);
    
    x1 = floor(x);
    y1 = floor(y);
    x2 = ceil(x);
    y2 = ceil(y);
    
    if (x1 < 1 || x2 > s1 || y1 < 1 || y2 > s2)
        pixel = 0;
    else
        px1 = image(x1,y1) + ((x - x1) * (image(x2,y1) - image(x1,y1)));
        px2 = image(x1,y2) + ((x - x1) * (image(x2,y2) - image(x1,y2)));
        
        pixel = px1 + ((y - y1) * (px2 - px1));        
    end;
end