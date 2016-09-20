
VAR = 0.5:0.5:5;
e = 1;

for g = VAR,

k = 500000;           %  # of random numbers
n = 1:k;            %  index for vectors

Vt = 1;
d1 = 0;
d2 = 0;


X = g.^(1/2).*randn(k,1);     %  generate random numbers for A
Y = g.^(1/2).*randn(k,1);     %  generate random numbers for B

    
%%%%%%%%%%%%%%%%%%If H1 is true
r1(n)=((3.+X).^2 + Y.^2).^(1/2);                  %  generate distribution of y
R1 = sort(r1);                                %  sort y in ascending order, store in Y

for t = n,
    if R1(t) > Vt;
        d1 = d1 + 1;
    end
end

Pd(e) = d1/k;



%%%%%%%%%%%%%%%%%If H0 is true
r2(n)=(X.^2 + Y.^2).^(1/2);                  %  generate distribution of y
R2 = sort(r2);                                %  sort y in ascending order, store in Y

for t = n,
    if R2(t) > Vt;
        d2 = d2 + 1;
    end
end

Pfa(e) = d2/k;

e = e+1;

end
%plot(VAR,Pd,'o')
%xlabel('Variance');		 %Label x-axis
%ylabel('Pd'); 				 %Label y-axis
%title('Figure 2.1:  Probability of Detection vs. Variance');	 %Create Graph Title


plot(VAR,Pfa,'o')
xlabel('Variance');		 %Label x-axis
ylabel('Pfa'); 				 %Label y-axis
title('Figure 2.2:  Probability of False Alarm vs. Variance');	 %Create Graph Title



