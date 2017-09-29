

startP = 0.5;
endP = 0.7;
stepP = 0.01;
N = 200;
iter = 100;
allow_perculation = true;

pV = (startP:stepP:endP)';

meanV = zeros(size(pV,1),1);
stdV = zeros(size(pV,1),1);
percV = zeros(size(pV,1),1);

figure(1)
xlabel('p')
ylabel('mean')
xlim([startP,endP])

for idx = 1:size(pV,1)


    [m,s,perc] = stat_p(N,pV(idx),iter,allow_perculation);
    
    meanV(idx) = m;
    stdV(idx) = s;
    percV(idx) = perc;
    
    plot(pV(1:idx),meanV(1:idx))
    pause(0.001)
    
end

plot(startP:stepP:endP, meanV)