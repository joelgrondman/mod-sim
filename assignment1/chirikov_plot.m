K = 1.02;
n = 10000;
Inits = [0 0.1;
         0 0.4;
         0 0.5;
         0 0.7777];
Inits = rand(100,2);
     
orbits = size(Inits,1);
seq = zeros(n,2);

set(gcf, 'Renderer', 'painters')
%set(gcf, 'Renderer', 'opengl')

close 1
figure(1)
xlabel('x')
ylabel('p')
xlim([0 1])
ylim([0 1])
title(['K=' num2str(K)])
hold on

for o=1:orbits
    Init = Inits(o,:);%rand(2,1);

    for i=1:n
       [Init(1),Init(2)] = chirikov_map(Init(1),Init(2),K);
       seq(i,:) = Init;
    end

    plot(seq(:,1),seq(:,2),'.k','MarkerSize',0.01)

end

hold off