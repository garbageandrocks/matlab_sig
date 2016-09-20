%Part 1, Fourier Transformer:  This script tests the accuracy of our code for %calculating the Fourier Transform of the function x(t)=rect((t-1)/2) by %graphing the magnitude and the angle of our estimated values, Y(w), with the %magnitude and angle of the True Fourier Transform, %X(w)=2*sinc((2*w)/(2*pi))*exp(-i*w).


t = -10:.001:10;             %Define the time range
w = -10:.001:10;    	     %Define the frequency range

n = 1;			     %Set counter = 1


x0 = 0 | t >= 0 & t <= 2;    		  %Define the input function x(t)
x1 = 2*sinc((2*w)/(2*pi)).*exp(-i*w); %Define the True Fourier Transform X(w) 


%%%%%Fourier Transformer
for k = w,           	        %Loop through all values of w
    e=exp(-1i*t*k);             %Define the exponential part of the integral
    y(n)=trapz(t,x0.*e);        %Calculate the integral
    n = n+1;                    %Add 1 to the index of the array
end



ang0 = angle(y);                 	%Calculate the angle of Y(w)
mag0 = abs(y);                   	%Calculate the magnitude of Y(w) 
ang1 = angle(x1);  			%Calculate the angle of X(w)
mag1 = abs(x1);    			%Calculate the magnitude X(w)


%%%%%Graph Magnitudes
subplot(211),					 %Open a subplot
plot(w,mag0,'o',w,mag1,'r'),  		 %Plot magnitudes against w
xlabel('Frequency in rad/sec');		 %Label x-axis
ylabel('Amplitude'); 				 %Label y-axis
title('Figure 1.1:  |X(w)| and |Y(w|');	 %Create Graph Title
legend('Estimated','True')			 %Create legend


%%%%%Graph Angles
subplot(212),					 
plot w,ang0,'o',w,ang1,'r'),   
xlabel('Frequency in rad/sec');		  
ylabel('Amplitude'); 
title('Figure 1.2:  Ang{X(w)} and Ang{Y(w)}');
legend('Estimated','True')
