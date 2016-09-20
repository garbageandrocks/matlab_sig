k = 10000;            %  # of random numbers
n = 1:k;            %  index for vectors
A = randn(k,1);     %  generate random numbers for A
B = randn(k,1);     %  generate random numbers for B

D = 0.01;           %  set delta y equal to 0.01

l = 0;              %  set number of y random no's in [yo, y0 + delta y]

y(n)=(A.^2 + B.^2).^(1/2);       %  generate distribution of y

Y = sort(y);                     %  sort y in ascending order, store in Y
for t = n,                       %  loop through all values of Y
    y0 = Y(t);                  %  use each value for y0
    for m = n,                   %  loop through all values of Y again
        if (y0 < Y(m) & Y(m) < y0+D)        %  if the value of Y falls within the range of y0 and y0 + delta Y
        l = l+1;                 %  increment l if condition is satisfied
        end %end if
    end %end 2nd for
    p = l/k;                    %  calculate the probability that y is within the range of y0 and y0 + delta Y 
    f(t) = p/D;                 %  calculate the pdf of y0
    l = 0;                      %  reset l to 0
    p = 0;
end %end 1st for


plot(Y,f,'o')

