%Part 3, Convolver:  This script tests the accuracy of our code for %calculating the Convolution of two functions, x(t)= exp(-3t)u(t) and 
%h(t) = exp(-2t)u(t), by graphing the real and the imaginary parts of our %estimated values, y0(t), with those of the true convolution 
%y1(t) =  exp(-2t)u(t) – exp(-3t)u(t).


t = -4:.001:4;                %Define the time range
w = -10:.001:10;    	      %Define the frequency range

n = 1;			      %Set counter = 1


x0 = zeros(size(p));                  %Initialize input x(t)
x0 = exp(-2.*t).*heaviside(w);   	  %Define x(t) for positive frequency 
h0 = zeros(size(p));                  %Initialize True Inverse Transform x(t)
h0 = exp(-3.*t).*heaviside(w);        %Define x(t) for positive frequency 
y1  =  exp(-2t)u(t) – exp(-3t)u(t)    %Define the true convolution y1(t)

%%%%%Fourier Transform of x(t)
for k = w,           	        %Loop through all values of w
    e=exp(-1i*t*k);             %Define the exponential part of the integral
    x1(n)=trapz(t,x0.*e);       %Calculate the integral
    n = n+1;                    %Add 1 to the index of the array
end

%%%%%Fourier Transform of h(t)
for k = w,           	        %Loop through all values of w
    e=exp(-1i*t*k);             %Define the exponential part of the integral
    h1(n)=trapz(t,h0.*e);       %Calculate the integral
    n = n+1;                    %Add 1 to the index of the array
end

y = x1.*h1;				  %Calculate Y(w)

%%%%%Inverse Fourier Transform of Y(w)
for k = t,						%Loop through all values of t
    e = exp(i*t*k);				%Define the exponential 
    y0(n) = (1/(2*pi))*trapz(w,y.*e);	%Calculate the integral
    n = n+1;					%Add 1 to the index of the array
end


real0 = real(y0);		%Define the real part of y0(t)
imag0 = imag(y0);		%Define the imaginary part of y0(t)
real1 = real(y1);		%Define the real part of y1(t)
imag1 = imag(y1);		%Define the imaginary part of y1(t)

%%%%%Graph Real parts
subplot(211),				 
plot((t,real0,'o',t,real1,'r'),	 
xlabel('Time in sec');			
ylabel('Amplitude’);
title('Figure 3.1:  Re{y0(t)} and Re{y1(t)}')
legend('Estimated','True')


%%%%%Graph Imaginary parts
subplot(212),			       
plot((t,imag0,'o',t,imag1,'r'),	
xlabel('Time in sec');
ylabel('Amplitude');
title('Figure 2.2:  Im{y0(t)} and Im{y1(t)}');
legend('Estimated','True')
