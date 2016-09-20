%Part 2, Inverse Fourier Transformer:  This script tests the accuracy of our %code for calculating the Inverse Fourier Transform of the function %X(w)=1/((2+i*w)^2) by graphing the real and the imaginary parts of our estimated %values, y(t), with those of the True Inverse Fourier Transform, 
%x(t)= u(t)*t*exp(-2t).


t = -4:.001:4;                %Define the time range
w = -10:.001:10;    	      %Define the frequency range

n = 1;			      %Set counter = 1


x0 = 1/((2+1i*w)^2);                  %Define the input function X(w)
x1 = zeros(size(p));                  %Initialize True Inverse Transform x(t)
x1 = w.*exp(-2.*w).*heaviside(w);     %Define x(t) for positive frequency 


%%%%%Inverse Fourier Transformer
for k = t,						%Loop through all values of t
    e = exp(i*t*k);				%Define the exponential 
    y(n) = (1/(2*pi))*trapz(w, x0.*e);	%Calculate the integral
    n = n+1;					%Add 1 to the index of the array
end



real0 = real(y);		%Define the real part of y(t)
imag0 = imag(y);		%Define the imaginary part of y(t)
real1 = real(x1);		%Define the real part of x(t)
imag1 = imag(x1);		%Define the imaginary part of x(t)


%%%%%Graph Real parts
subplot(211),				 
plot((t,real0,'o',t,real1,'r'),	 
xlabel('Time in sec');			
ylabel('Amplitude’);
title('Figure 2.1:  Re{x(t)} and Re{y(t)}')
legend('Estimated','True')


%%%%%Graph Imaginary parts
subplot(212),			
plot((t,imag0,'o',t,imag1,'r'),	
xlabel('Time in sec');
ylabel('Amplitude');
title('Figure 2.2:  Im{x(t)} and Im{y(t)}');
legend('Estimated','True')
