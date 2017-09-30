function hist = invper_average_histogram(N,runs)
    M = [];
    for i=0:runs
        M = cat(2,M,invasion_percolation(N));
    end
    figure(1)
    hist = histogram(M)
end