%% Non-uniform dice: 
% Define the parameters
N = 1000;

% creat N ramdon numbers, Sample = unifrnd (0,6,N,1);
Samp = unifrnd (0,6,N,1);

%creat a matrix H for storaging Store the frequency of each letter
%The random sample I designed was N. In order to avoid introducing redundant 
%    variables, I also used N as the number of experiments. 
%    But in fact the N in these two places is not necessarily related.
H = zeros(2,N);
%% Calculate shannon's entropy

for i = 1:N
    H(2,i) = - (i/N)*log((i/N))/log(6)-5*((N-i)/(5*N))*log((N-i)/(5*N))/log(6);   
    
    %The group of numbers stored by the edges, with which the whole sample 
    % is divided into six parts. The size of the first portion is 1-N, 
    edges = zeros(1,7); 
    edges(1,2) = (i/N)*6;
    
    % while the remaining five portions are divided equally
    Int = ((N-i)/5)/N*6;
for j= 3:7
    edges(1,j) = edges(1,j-1)+Int;
end

% Calculate shannon's entropy
for k = 1:6 
    p = length(find(Samp > edges(1,k)&Samp <= edges(1,k+1)))/N;
    H(1,i) = H(1,i) - p*log(p)/log(6);
end
end
%% draw the figure
tiledlayout(1,1)
scatter(0.001:0.001:1,H(1,:),'filled')
hold on;
line([1/6 1/6],[0 1],'Color','red','LineStyle','--','LineWidth',3);
%title('Exhaustive dice')
xlabel('P_i')
xticks([0 0.1 1/6 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9 1.0])
xticklabels({'0','0.1','1/6','0.2','0.3','0.4','0.5','0.6','0.7','0.8','0.9','1'})
ylabel('Information Entropy')
hold off;




