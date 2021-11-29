function result = Rgb2Gray(im, op, ratio)
    im = double(im);
    r = im(:, :, 1);
    g = im(:, :, 2);
    b = im(:, :, 3);
    
    if op==1
        result = r;
    elseif op==2
        result = g;
    elseif op==3
        result = b;
    elseif op==4
        result = (r + g + b) / 3;
    elseif op==5
        result = ratio(1)*r + ratio(2)*g + ratio(3)*b;
    end
    
    result = uint8(result);
end

