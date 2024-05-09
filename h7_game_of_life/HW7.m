b = 1.9;
maxiter = 1000;
p = 101;
q = 101;

% for i = 1:p             %create two dimensional array
%     for j= 1:q
%         M(i,j) = 1;     %set all squares to Loyal
%     end
% end

M = ones(p,q);
M(51,51) = 0;           % set board center to Traitor

game_of_evolution(M,maxiter,b)

% second run
nclusters = 10;
M = ones(p,q);

for n = 1:nclusters
    j = randi([2 q-1],1);                   %random row
    k = randi([2 p-1],1);                   %random col
    M(j-1:j+1, k-1:k+1) = (rand(3) > 0.5);  %write rand grid to array
end

game_of_evolution(M,maxiter,b)