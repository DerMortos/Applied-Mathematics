function game_of_evolution(M,maxiter,b)
% M         - initial binary gameboard
% maxiter   - max # of evolution cyles
% b         - max sentence length

[p,q] = size(M);

% these transformations move the entire board
n = [2:p 1];    %North (up) shift
s = [p 1:p-1];  %South (down) shift
w = [2:q 1];    %West (left) shift
e = [q 1:q-1];  %East (right) shift


cmap = [0 0 1  % BLUE
        1 0 0  % RED
        1 1 0  % YELLOW
        0 1 0];% GREEN
    
for iter = 1:maxiter
    
    S = M(n,:) + ...    %Add Northern neighbor
        M(s,:) + ...    %Add Southern neighbor
        M(:,w) + ...    %Add Western neighbor
        M(:,e) + ...    %Add Eastern neighbor
        M(n,w) + ...    %Add Northwestern neighbor
        M(n,e) + ...    %Add Northeastern neighbor
        M(s,e) + ...    %Add Southeastern neighbor
        M(s,w) + ...    %Add Southwestern neighbor
        M(:,:);
    
    SB = S.*M + b*S.*~M;    %scoreboard
    Mnew = newboard(M,SB);   %blackmagic
    
    % elementwise comparison of previous state to new state
    blue =  M == 1 & Mnew == 1;
    red =   M == 0 & Mnew == 0;
    yellow= M == 1 & Mnew == 0;
    green = M == 0 & Mnew == 1;
    
    C = 0*blue + .25*red + .5*yellow + 1*green;
    
    % illustrate C
    figure(1);
    imagesc(C,[0 1]); %[0 1] is the range of colormap
    colormap(cmap)
    set(gca,'XTick',[],'YTick',[])
    box on; axis equal; axis tight; drawnow
    
    % update board states
    M = Mnew;
end
    