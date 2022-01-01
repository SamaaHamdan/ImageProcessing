function result = darkness(im, op, k)
    im = double(im);
    

    if op=='-'
        result = im - k;
    elseif op=='*'
        result = im * k;
    end
    
    [H, W, L] = size(result);
    for i=1:H
        for j=1:W
            for k=1:L
                if result(i, j, k) > 255
                    result(i, j, k) = 255;
                elseif result(i, j, k) < 0
                    result(i, j, k) = 0;
                end
            end
        end
    end
    
    result = uint8(result);
end

