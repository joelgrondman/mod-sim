
p = 0.7;
N = 40;
iter = 1;

Area = zeros(iter,1);
for i = 1:iter

    A = 0;
    perc = 1;
    while(perc == 1)
        [~,A,perc] = generate_perculation(p,N);
    end
    
    Area(i) = A;
    
end

meanArea = mean(Area)
std(Area)