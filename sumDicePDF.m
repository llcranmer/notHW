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
