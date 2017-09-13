

n = 2000;
orbits = 2000;
startK = .7;
endK = 1100;
stepsize = 0.01;
seq = zeros(n,2);
set(gcf, 'Renderer', 'painters')
%set(gcf, 'Renderer', 'opengl')


for K = startK:stepsize:endK
    % clf;
    kamCount = 0;
    for o=1:orbits

        Init = rand(2,1);
        for i=1:n
           [Init(1),Init(2)] = chirikov_map(Init(1),Init(2),K);
           seq(i,:) = Init;
        end
        
        sortedseq = sort(seq(:,1),1);
        dif = diff(sortedseq,[],1);
       
        if max(dif) < .001 && min(seq(:,1)) < .001 && max(seq(:,1)) > .999
          %  plot(seq(:,1),seq(:,2),'k.','MarkerSize',0.01)
          %  hold on
          %  xlim([0 1])
          %  ylim([0 1]);
          kamCount = 1;
          break;
        end 
    end
    if kamCount == 0
        disp(K)
        return;
    end
    % hold off
    % pause

end