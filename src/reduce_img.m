function [r] = reduce_img(img, M, U_K)
% Returns the vector r given in input img, M, U_K.
%
% img is the vector containing the flattened image
% M is the matrix containing the mean face
% U_K is the matrix containing the first k eigenfaces
% 
% r is the vector containing the flattened reduced image

% zero mean centering
img_zero_mean = img - M;

% computing the reduced image
r = U_K' * img_zero_mean;