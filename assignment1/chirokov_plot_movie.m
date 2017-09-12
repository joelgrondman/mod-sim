

n = 100;
orbits = 100;
startK = 0;
endK = 1;
stepsize = 0.01;

seq = zeros(n,2);
set(gcf, 'Renderer', 'painters')
%set(gcf, 'Renderer', 'opengl')


for K = startK:stepsize:endK

    for o=1:orbits

        Init = rand(2,1);

        for i=1:n
           [Init(1),Init(2)] = chirikov_map(Init(1),Init(2),K);
           seq(i,:) = Init;
        end

        plot(seq(:,1),seq(:,2),'k.','MarkerSize',0.01)
        hold on
        xlim([0 1])
        ylim([0 1]);
    end
    hold off
    pause(0.1)

end