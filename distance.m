% MATLAB Code to calculate the minimum Hamming Distance for a code C
% Author: Priya Jain

codewords = [0 1 1 1 0 1 1 1;
             1 0 1 1 1 1 1 0;
             1 1 0 1 1 1 0 1;
             1 1 1 0 1 0 1 1];

% Number of codewords
[num_code, n] = size(codewords);

% Generate all possible linear combinations of codewords
num_combine = 2^num_code - 1; % Exclude the all-zero vector
min_hamming_distance = n; % Initialize minimum Hamming distance

% Loop over all nonzero binary vectors
for combinaton = 1:num_combine
    binary_vector = dec2bin(combinaton, num_code) - '0'; % Convert to binary vector
    linear_combination = mod(binary_vector * codewords, 2); % Compute linear combination mod 2
    
    % Exclude the all-zero codeword
    if any(linear_combination)
        hamming_distance = sum(linear_combination);
        
        % Update minimum Hamming distance
        if hamming_distance < min_hamming_distance
            min_hamming_distance = hamming_distance;
        end
    end
end

% Display the result
disp(['The minimum Hamming distance is: ', num2str(min_hamming_distance)]);
