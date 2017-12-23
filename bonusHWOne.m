%% CASE 1 TWO DICE
% Roll the dice "numberOfRolls" times
numberOfRolls = 2000; % Number of times you roll all 6 dice.
n = 2; % Number of dice.
maxFaceValue = 6;
rolls = randi(maxFaceValue, n, numberOfRolls);
% Sum up dice values for each roll.
colSums = sum(rolls, 1);
% Find out how many times each sum occurred.
edges = min(colSums):max(colSums);
counts = histc(colSums, edges);
% Normalize
totalSum = sum(counts(:))
normalizedCountSums = counts / totalSum
bar(edges, normalizedCountSums, 'BarWidth', 1);
grid on;
title('Frequency of Roll Sums Case 1', 'FontSize', 22);
%% CASE 2 THREE DICE 
% Roll the dice "numberOfRolls" times
numberOfRolls = 2000; % Number of times you roll all 6 dice.
n = 3; % Number of dice.
maxFaceValue = 6;
rolls = randi(maxFaceValue, n, numberOfRolls);
% Sum up dice values for each roll.
colSums = sum(rolls, 1);
% Find out how many times each sum occurred.
edges = min(colSums):max(colSums);
counts = histc(colSums, edges);
% Normalize
totalSum = sum(counts(:))
normalizedCountSums = counts / totalSum
bar(edges, normalizedCountSums, 'BarWidth', 1);
grid on;
title('Frequency of Roll Sums Case 2', 'FontSize', 22);
%% CASE 3 FOUR DICE 
% Roll the dice "numberOfRolls" times
numberOfRolls = 2000; % Number of times you roll all 6 dice.
n = 4; % Number of dice.
maxFaceValue = 6;
rolls = randi(maxFaceValue, n, numberOfRolls);
% Sum up dice values for each roll.
colSums = sum(rolls, 1);
% Find out how many times each sum occurred.
edges = min(colSums):max(colSums);
counts = histc(colSums, edges);
% Normalize
totalSum = sum(counts(:))
normalizedCountSums = counts / totalSum
bar(edges, normalizedCountSums, 'BarWidth', 1);
grid on;
title('Frequency of Roll Sums Case 3', 'FontSize', 22);
%% GAMBLING 
% Roll the dice "numberOfRolls" times
numberOfRolls = 2000; % Number of times you roll all 6 dice.
n = 4; % Number of dice.
maxFaceValue = 6;
rolls = randi(maxFaceValue, n, numberOfRolls);
% Sum up dice values for each roll.
colSums = sum(rolls, 1);
% Find out how many times each sum occurred.
edges = min(colSums):max(colSums);
counts = histc(colSums, edges);
% Normalize
totalSum = sum(counts(:))
normalizedCountSums = counts / totalSum;
bar(edges, normalizedCountSums, 'BarWidth', 1);
grid on;
title('Gambling with Alice', 'FontSize', 22);

%% P4
% the chance that I win is the sum of the probabilities of rolling a number
% greater than 15. Hence, whenever I ran it on my machine the first time it
% was approximately 0.0485 + 0.0195 + 0.0165 + 0.0055 + 0.0020 + 1.0e-3 =
% 0.096 * 100 = 9.6 % which is not a favorable chance of winning. 

%% P5 
% I would not gamble wit Alice the odds are 10 to 1 yet the payout is not
% 10 to 1 so therefore the risk is not worth small reward of $5.

%% P6  26 Dice 

% Roll the dice "numberOfRolls" times
numberOfRolls = 2000; % Number of times you roll all 6 dice.
n = 26; % Number of dice.
maxFaceValue = 6;
rolls = randi(maxFaceValue, n, numberOfRolls);
% Sum up dice values for each roll.
colSums = sum(rolls, 1);
% Find out how many times each sum occurred.
edges = min(colSums):max(colSums);
counts = histc(colSums, edges);
% Normalize
totalSum = sum(counts(:))
normalizedCountSums = counts / totalSum;
bar(edges, normalizedCountSums, 'BarWidth', 1);
grid on;
title('26 DICE', 'FontSize', 22);

%% P6 This is how the function should look it needs to be saved in a script file for it to work and then 
% be called in this file 
function faceValueProbability = sumDicePDF( n, rolls, faceValue )
numberOfRolls = rolls; % Number of times you roll all 6 dice.
a = n; % Number of dice.
maxFaceValue = faceValue;
rolls = randi(maxFaceValue, a, numberOfRolls);
% Sum up dice values for each roll.
colSums = sum(rolls, 1);
% Find out how many times each sum occurred.
edges = min(colSums):max(colSums);
counts = histc(colSums, edges);
% Normalize
totalSum = sum(counts(:))
normalizedCountSums = counts / totalSum
bar(edges, normalizedCountSums, 'BarWidth', 1);
grid on;
title('Frequency of Roll Sums Case 1', 'FontSize', 22);
end




