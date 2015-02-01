function pixel = GetPixelNearest(image, x, y)
    s1 = size(image,1);
    s2 = size(image,2);
    
    x = round(x);
    y = round(y);
    
    if (x < 1 || x > s1 || y < 1 || y > s2)
        pixel = 0;
    else
        pixel = image(x,y);
    end;
end