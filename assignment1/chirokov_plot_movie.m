n = 1000000;
startK = 0;
endK = 3;
stepsize = 0.01;

Inits = rand(1,2)

orbits = size(Inits,1);
seq = zeros(n,2);

set(gcf, 'Renderer', 'painters')
%set(gcf, 'Renderer', 'opengl')

close 1
figure(1)

for K = startK:stepsize:endK
    for o=1:orbits
        
        Init = Inits(o,:);
        
        for i=1:n
           [Init(1),Init(2)] = chirikov_map(Init(1),Init(2),K);
           seq(i,:) = Init;
        end
        plot(seq(:,1),seq(:,2),'k.','MarkerSize',0.01)
        hold on

    end
    hold off
    
    xlabel('x')
    ylabel('p')
    xlim([0 1])
    ylim([0 1])
    title(['K=' num2str(K)])
    
    pause(0.001)
end