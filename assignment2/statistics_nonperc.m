

startP = 0.5;
endP = 0.7;
stepP = 0.01;
N = 20;
iter = 50;

meanS = zeros((endP-startP)/stepP + 1,1);
stdS = zeros((endP-startP)/stepP + 1,1);

for i = 1:iter

    A = 0;
    perculating = true;
    while(perculating)
        [~,A,perculating] = generate_perculation(p,N);
    end
    
    Area(i) = A;
    
end

meanArea = mean(Area)
std(Area)