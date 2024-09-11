% MATLAB Code to calculate the Hamming Distance required for the EBHC
% Author:- Priya Jain

codewords = [0 1 1 1 0 1 1 1;
             1 0 1 1 1 1 1 0;
             1 1 0 1 1 1 0 1;
             1 1 1 0 1 0 1 1];
% Number of codewords
[num_codewords, n] = size(codewords);

% Initialize the minimum Hamming distance to a large number
min_hamming_distance = n;

% Calculate the Hamming distance between all pairs of codewords
for i = 1:num_codewords-1
    for j = i+1:num_codewords
        % Calculate the Hamming distance between codeword i and codeword j
        hamming_distance = sum(codewords(i,:) ~= codewords(j,:));
        
        % Update the minimum Hamming distance
        if hamming_distance < min_hamming_distance
            min_hamming_distance = hamming_distance;
        end
    end
end

% Display the result
disp(['The minimum Hamming distance is: ', num2str(min_hamming_distance)]);
