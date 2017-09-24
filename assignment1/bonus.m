n = 100000;
K = .5;
seq = zeros(n,2);
seq2 = zeros(n,2);
%set(gcf, 'Renderer', 'painters')
%set(gcf, 'Renderer', 'opengl')


Init = rand(2,1);
BInit = Init;
period = -1;
for i=1:n
   [Init(1),Init(2)] = chirikov_map(Init(1),Init(2),K);
   seq(i,:) = [v(Init(1),K),Init(1)];
   seq2(i,:) = [Init(1),Init(2)];
   if(round(Init,3) == round(BInit,3))
       break;
   end
end
period = i;

subplot(1,2,1);
plot(seq(:,2),seq(:,1),'k.','MarkerSize',0.01);
xlim([0 1]);
ylim([0 (K/((2*pi)^2))*2]);
title('Positions in chain model');
xlabel('x');
ylabel('V(x)');

subplot(1,2,2);
plot(seq2(:,1),seq2(:,2),'k.','MarkerSize',0.01);
ylim([0 1]);
xlim([0 1]);
title('Positions in standard map');
xlabel('x');
ylabel('p');

sortedseq = sortrows(seq2);
w = (sortedseq(n,1)-sortedseq(1,1))/period;
