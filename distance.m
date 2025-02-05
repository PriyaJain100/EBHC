% MATLAB Code to calculate the minimum Hamming Distance for a code C
% Author: Priya Jain

codewords = [1 0 1 0 1 1 1 1;
             0 1 0 1 1 1 1 1;
             1 0 1 0 1 1 1 1;
             0 1 0 1 1 1 1 1];

% Number of codewords
[num_code, n] = size(codewords);

% Initialize the minimum Hamming distance to a large number
min_hamming_distance = n;

% Loop over all pairs of codewords
for i = 1:num_code-1
    for j = i+1:num_code
        % Calculate Hamming distance between codewords i and j
        hamming_distance = sum(codewords(i,:) ~= codewords(j,:));
        
        % Update minimum Hamming distance
        if hamming_distance < min_hamming_distance
            min_hamming_distance = hamming_distance;
        end
    end
end

% Display the result
disp(['The minimum Hamming distance is: ', num2str(min_hamming_distance)]);
