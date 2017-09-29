
p = 0.50;
N = 400;
iter = 100;

Area = zeros(iter,1);

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