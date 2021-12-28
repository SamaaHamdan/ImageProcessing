function s = InvLog(r, c)
    r = im2double(r);
    
    s = power(2.0, r/c) - 1;
    s = im2uint8(s);
end

