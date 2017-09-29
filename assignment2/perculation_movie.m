function [M, area, perculating] = perculation_movie(N,p,allow_perculation,save)

    %0 = unmarked, 1 = occupied, 2 = empty
    M = zeros(2*N+1,2*N+1);
    M(N+1,N+1)=1;
    
    areaold = 0;
    area = 1;
    
    %logical symbol switched, saves additional logic later
    randomField = rand(2*N+1,2*N+1) > p;
    

    writerObj = VideoWriter('out4.avi'); % Name it.
    writerObj.FrameRate = 60; % How many frames per second.
    if (save)
        open(writerObj); 
    end
    figure(1)
    imshow((M==0)*0.5+(M==2))
    
    if (save)
        frame = getframe(gcf); % 'gcf' can handle if you zoom in to take a movie.
        writeVideo(writerObj, frame);
    end
    
    %check if cluster is perculating
    perculating = (sum(M(1,:)==1) + sum(M(end,:)==1) +...
          sum(M(:,1)==1) + sum(M(:,end)==1)) > 0;
    
    %keep growing till area is constant
    while(area - areaold > 0 && (~perculating || allow_perculation))
        
        %0=> grey 1=>black 2=> white
        
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

        %empty or occupy (from already determined random values)
        growthArea = growthArea.*(randomField + 1);

        %apply to M
        M =  M + growthArea;
        
        %update area
        areaold = area;
        area = sum(M(:)==1);
        
        %check if cluster is perculating
        perculating = (sum(M(1,:)==1) + sum(M(end,:)==1) +...
          sum(M(:,1)==1) + sum(M(:,end)==1)) > 0;
        
        pause(0.001)
        figure(1)
        imshow((M==0)*0.5+(M==2))
        
        if (save)
            frame = getframe(gcf); % 'gcf' can handle if you zoom in to take a movie.
            writeVideo(writerObj, frame);
        end
        
    end
    if (save)
        close(writerObj);
    end

end

