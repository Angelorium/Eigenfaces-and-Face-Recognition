function [img] = recognize_img(U_K, R, M, r, height, width)
% Returns img given in input U_K, R, M, r, height, width.
%
% U_K is the matrix containing the first k eigenfaces
% R is the matrix containing the flattened reduced images
% M is the matrix containing the mean face
% r is the image to be recognized
% height is the heigth of the image
% width is the width of the image.
%
% img is the image found

% searching the image
n = size(R, 2);
error = inf;
for i=1:n
    new_error = norm(r - R(:, i), 2);
    if new_error < error
        error = new_error;
        k = i;
    end 

    % recovering the image
    img = recover_image(U_K, R, M, k, height, width);
end