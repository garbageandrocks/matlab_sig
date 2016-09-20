k = 50000;           %  # of random numbers
n = 1:k;            %  index for vectors
X = randn(k,1);     %  generate random numbers for A
Y = randn(k,1);     %  generate random numbers for B
D = 0.01;           %  set delta y equal to 0.01
l = 0;              %  set number of y random no's in [yo, y0 + delta y]
Vt = 1;
d1 = 0;
d2 = 0;
Z0 = 1.96;
x1 = 0;
x2 = 0;
s1 = 0;
s2 = 0;


%%%%%%%%%%%%%%%%%%If H1 is true
r1(n)=((3.+X).^2 + Y.^2).^(1/2);                  %  generate distribution of y
R1 = sort(r1);                                %  sort y in ascending order, store in Y

for t = n,
    if R1(t) > Vt;
        d1 = d1 + 1;
    end
end

Pd = d1/k;
%%%%%%%%%%%%%%Calculate Sample Mean
for t = n,                      %  loop through all values of y
    x1 = x1 + r1(t);               %  sum all values of y
end

M1 = x1/k;                      %  divide the sum by the number of samples to compute the sample mean

%%%%%%%%%%%%%%%Calculate Sample Variance
for t = n,                      %  loop through all values of y
    s1 = s1 + (r1(t) - M1).^2;       %  sum the squares of all values minus the mean
end

S1 = s1/(k-1);                    %  divide the sum by the number of samples minus 1 to compute the sample variance

%%%%%%%%%%%%%%%%Calculate the 95% confidence interval for Pd
range1 = Z0 * (S1^(1/2)/k^(1/2));

%%%%%%%%%%%%%%%%%If H0 is true
r2(n)=(X.^2 + Y.^2).^(1/2);                  %  generate distribution of y
R2 = sort(r2);                                %  sort y in ascending order, store in Y

for t = n,
    if R2(t) < Vt;
        d2 = d2 + 1;
    end
end

Pfa = d2/k;

%%%%%%%%%%%%%%Calculate Sample Mean
for t = n,                      %  loop through all values of y
    x2 = x2 + r2(t);               %  sum all values of y
end

M2 = x2/k;                      %  divide the sum by the number of samples to compute the sample mean

%%%%%%%%%%%%%%%Calculate Sample Variance
for t = n,                      %  loop through all values of y
    s2 = s2 + (r2(t) - M2).^2;       %  sum the squares of all values minus the mean
end

S2 = s2/(k-1);                    %  divide the sum by the number of samples minus 1 to compute the sample variance

%%%%%%%%%%%%%%%%Calculate the 95% confidence interval for Pd
range2 = Z0 * (S2^(1/2)/k^(1/2));




