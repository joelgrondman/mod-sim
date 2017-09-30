function [M] = invasion_percolation(N)

    %0 = unmarked, 1 = occupied
    M = zeros(2*N+1,2*N+1);
    M(N+1,N+1)= 1;
       
    randomField = rand(2*N+1,2*N+1);
    
    %keep growing until is percolating cluster
    while((sum(M(1,:)==1) + sum(M(end,:)==1) +...
                  sum(M(:,1)==1) + sum(M(:,end)==1)) == 0) 
              
        o_M = (M == 1);
        %occupied spaces of M shifted in 4 directions
        M_up =    [o_M(2:end,:);     zeros(1,2*N+1)];
        M_down =  [zeros(1,2*N+1); o_M(1:end-1,:)];
        M_left =  [o_M(:,2:end)      zeros(2*N+1,1)];
        M_right = [zeros(2*N+1,1)  o_M(:,1:end-1)];
        
        %determine possible grow area
        growthArea = (M_up+M_down+M_left+M_right)>0;
        %filter out already marked spaces
        growthArea(M~=0) = 0;
        
        %determine candidates
        growthAreaBackup = growthArea;
        growthArea = growthArea.*(randomField);
        growthArea(growthAreaBackup==0) = nan;
        
        %find smalest element's index
        [~,ind] = min(growthArea(:));
        [I,J] = ind2sub([size(growthArea,1) size(growthArea,2)],ind);
        
        %apply to M
        M(I,J) = 1;        
    end
    
    figure(1)
    imshow(M)
    
    newM = M;
    newM(M==0) = nan; 
    
    M = reshape(newM.*randomField,[1,numel(newM.*randomField)]);
    M(isnan(M)) = [];
end