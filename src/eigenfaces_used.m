function [x, y] = eigenfaces_used(X)
% Returns the vectors relative to the eigenfaces used 
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
    [U_K, ~, ~] = reduce(X, captured_info);
    size_U_K = size(U_K);
    
    eigenfaces_used = size_U_K(2);

    x(i) = round(captured_info * 100);
    y(i) = eigenfaces_used;

end

% plotting result
plot(x, y);
xlabel('Captured information (%)');
ylabel('Eigenfaces used');
grid on