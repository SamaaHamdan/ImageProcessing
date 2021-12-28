function result = Gray2Binary(im, T)
    [H, W] = size(im);
    result = zeros(H, W);
    
    for i=1:H
        for j=1:W
            if im(i, j) > T
                result(i, j) = 1;
            else
                result(i, j) = 0;
            end
        end
    end
    
    result = logical(result);
end

