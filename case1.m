% uniform dice: 
% Define the parameters
N = 200;

% creat N ramdon numbers, Sample = unifrnd (0,6,N,1);
% ceil()the ramdon number
% uniform dice: 
dice = ceil(unifrnd (0,6,N,1));
Entr = zeros(N,1);
% calucate the shannon entropy; 
% The step-by-step calculations are as follows:
% dice1 = length(find(dice == 1));
% p1 = dice1/N;
% E1 = p1*log(p1)/log(6);
% E1 = (length(find(dice == 1))/N)*(log((length(find(dice == 1))/N))/log(6));

% Write it as a cycle
for i = 6:N
    sample = dice(1:i);
    for j = 1:6
        H = (length(find(sample == j))/i)*(log((length(find(sample == j))/i))/log(6));
        eval(['E' num2str(j) '=' num2str(H)]);
        if H<=0
            Entr(i,1) =Entr(i,1) - H;
        end
    end
end

% print the result
fprintf('The theoretical Shannon entropy of this dice is 1, but the simulated Shannon entropy %8.4f\n', Entr(N,1))

%draw the histogram
tiledlayout(1,2)
nexttile
h1 = histogram(dice,6);
title('(a)')
%Histogram of Frequency Distribution of Dice Roll
xlabel('The Face of The Die')
ylabel('Frequency')

%
nexttile
scatter(6:N,Entr(6:N),'filled')
title('(b)')
%Information Entropy Varies with The Number of Rolls
xlabel('The Number of Rolls')
ylabel('Information Entropy of The Die')

set(gcf,'position',[200,100,900,400]);
