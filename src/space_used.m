function [x, y] = space_used(X)
% Returns the vectors relative to the memory used to store the images
% as the captured information varies
%
% X is the matrix containing the flattened images
% 
% x is the array containing the captured information
% y is the array containing the saved space 

% initializing arrays
x = zeros(1, 9);
y = zeros(1, 9);

for i=1:1:9
    captured_info = i / 10;
    
    % reducing the images
    [U_K, R, M] = reduce(X, captured_info);
    
    % computing size of matrices
    size_X = size(X);
    size_R = size(R);
    size_U_K = size(U_K);
    size_M = length(M);

    % computing used space, reduced space and saved space
    original_used_space = size_X(1) * size_X(2);
    reduced_used_space = size_R(1) * size_R(2) + size_U_K(1) * size_U_K(2) + size_M;
    saved_space = round((1 - reduced_used_space / original_used_space) * 100);

    x(i) = round(captured_info * 100);
    y(i) = saved_space;

end

% plotting results
bar(x, y);
xlabel('Captured information (%)');
ylabel('Saved space (%)');
grid on