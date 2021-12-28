function s = Log(r, c)
    r = im2double(r);
    
    s = c * log2(1 + r);
    s = im2uint8(s);
end

