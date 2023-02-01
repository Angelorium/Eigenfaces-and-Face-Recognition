function [I] = recover_image(U_K, R, M, i, height, width)
% Returns the recovered image from reduced size data given U_K, R, M, i,
% height, width
%
% U_K is the matrix containing the first k eigenfaces
% R is the matrix containing the flattened reduced images
% M is the matrix containing the mean face
% i is the index of the image to be recovered
% height is the heigth of each image
% width is the width of each image
%
% I is the recovered image

% recovering the flattened zero mean centered image
image_zero_mean = U_K * R(:, i);  

% adding mean faces to zero mean centered image
image_flattened = image_zero_mean + M;  

% reshaping the image to original size
I = reshape(image_flattened, [height, width]);