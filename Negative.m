
function S = Negative(img)
    img = im2double(img);
    
    S = 1 - img;
    S = im2uint8(S);
end



