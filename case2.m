% uniform dice: 
% Define the parameters
N = 200;

% creat N ramdon numbers, Sample = unifrnd (0,6,N,1);
% ceil()the ramdon number
% uniform dice: 
dice = unifrnd (0,6,N,1);
Entr = zeros(N,1);
%%
edges = zeros(1,7);
E = unifrnd (0,1,6,1);
ES = sum(E);
TH = 0;
for k= 1:6
    edges(1,k+1) = edges(1,k)+(E(k,1)/ES)*6;
    p = E(k,1)/ES;
    TH = TH - p*log(p)/log(6);
end
%%
% Write it as a cycle
for i = 6:N
    sample = dice(1:i);
    for j = 1:6
         p = length(find(sample > edges(1,j)&sample <= edges(1,j+1)))/i;
         H = - p*log(p)/log(6);
         eval(['E' num2str(j) '=' num2str(H)]);
         if H>=0
            Entr(i,1) =Entr(i,1) + H;
        end
    end
end


%%
% print the result
fprintf('The theoretical Shannon entropy of this dice is  %8.4f\n',TH)
fprintf('But the simulated Shannon entropy is %8.4f\n', Entr(N,1))

%draw the histogram
tiledlayout(1,2)
nexttile
h1 = histogram(dice,edges);
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
