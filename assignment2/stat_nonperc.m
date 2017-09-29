function [m, s] = stat_nonperc(N, p, iter)

    Area = zeros(iter,1);

    for i = 1:iter

        A = 0;
        perculating = true;
     while(perculating)
         [~,A,perculating] = generate_perculation(p,N);
     end
    
      Area(i) = A;
    
    end

    m = mean(Area);
    s = std(Area);
end

