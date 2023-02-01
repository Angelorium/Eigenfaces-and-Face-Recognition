function [U_K, R, M] = reduce(X, captured_info_tol)
% Returns the matrix U_K, R, M given in input X, height, width and
% captured_info_tol.
%
% X is the matrix containing the flattened images
% captured_info_tol (between 0 and 1) is the desidered information 
% to be captured.
% 
% U_K is the matrix containing the first k eigenfaces
% R is the matrix containing the flattened reduced images
% M is the matrix containing the mean face

% computing matrix M
M = mean(X, 2);

% zero mean centering of X
X_zero_mean = X - M;

% Singular Value Decomposition 
[U, S, ~] = svd(X_zero_mean, 'econ');

% Selecting the number of eigenvectors to capture the desidered information
S_diag = diag(S).^2;
captured_info = 0;
k = 1;
while(captured_info < captured_info_tol)
    captured_info = sum(S_diag(1:k)) / sum(S_diag);
    k = k + 1;
end

% selecting only the first k eigenvectors
U_K = U(:, 1:k);

% computing the reduced images
R = U_K' * X_zero_mean;  