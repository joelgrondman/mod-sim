n = 40000;
orbits = 500;
startK = .7;
endK = 10;
stepsize = 0.01;
seq = zeros(n,2);
%set(gcf, 'Renderer', 'painters')
%set(gcf, 'Renderer', 'opengl')

for K = startK:stepsize:endK
    % clf;
    kamCount = 0;
    for o=1:orbits

        Init = [0, rand(1,1)];
        for i=1:n
           [Init(1),Init(2)] = chirikov_map(Init(1),Init(2),K);
           seq(i,:) = Init;
        end
       
        %plot(seq(:,1),seq(:,2),'k.','MarkerSize',0.01)
        %hold on
        %xlim([0 1]);
        %ylim([0 1]);
        
        sortedseq = sortrows(seq);
        if(isKam(sortedseq))
            kamCount = 1;
            break;
        end;
        %hold off
        %pause
    end
    if kamCount == 0      
        disp(K)
        return;
    end

end

function t = isKam(seq)
    if(max(seq(1)) > 1-.001)
        t = false;
        return;
    end
    t = true;
    for i=2:size(seq,1)
        if(seq(i,1)-seq(i-1,1) > .001 || seq(i,2)-seq(i-1,2) > .001)
            t = false;
            return
        end
    end
end
