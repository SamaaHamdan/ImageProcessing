function s = Gamma(r, c, y)
    r = im2double(r);
    
    s = c * power(r, y);
    s = im2uint8(s);
end


