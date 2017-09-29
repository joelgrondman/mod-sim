function [m, s, p] = stat_p(N, p, iter, allow_perculation)

    Area = zeros(iter,1);
    perc = zeros(iter,1);
    
    for i = 1:iter

        A = 0;

        perculating = true;
        if (allow_perculation)
           [~,A,perculating] = generate_perculation(N,p, allow_perculation);
        else 
            while(perculating)
                [~,A,perculating] = generate_perculation(N,p, allow_perculation);
            end
            
        end

      perc(i) = perculating;
      Area(i) = A;
    
    end

    m = mean(Area);
    s = std(Area);
    p = sum(perc == true)/iter;
end

