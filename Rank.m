% MATLAB Code to calculate the Rank required for the Extended Binary Hamming Code
% Authors:- Priya Jain
A=[0 1 1 1 0 1 1 1;
   1 0 1 1 1 1 1 0;
   1 1 0 1 1 1 0 1;
   1 1 1 0 1 0 1 1;
   0 1 1 1 0 1 1 1;
   1 1 1 0 1 0 1 1;
   1 1 0 1 1 1 0 1;
   1 0 1 1 1 1 1 0];
% Perform Gaussian elimination mod 2
[m, n] = size(A);
for i = 1:min(m,n)
    % Find a row with a leading 1 in the i-th column
    pivotRow = find(A(i:end,i), 1) + i - 1;
    if ~isempty(pivotRow)
        % Swap the current row with the pivot row if necessary
        if pivotRow ~= i
            A([i pivotRow], :) = A([pivotRow i], :);
        end
        
        % Eliminate the entries below the pivot
        for j = i+1:m
            if A(j,i) == 1
                A(j,:) = mod(A(j,:) + A(i,:), 2);
            end
        end
    end
end

% Count the number of non-zero rows to find the rank
rank_mod_2 = sum(any(A, 2));

% Display the result
disp(['The rank of the matrix modulo 2 is: ', num2str(rank_mod_2)]);
