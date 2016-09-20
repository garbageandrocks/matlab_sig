%Part 4: Modulator:  This script graphs the input, x(t) = rect((t-1)/2) and 
%wc = 15, and the output, y(t)=x(t)*cos(wc*t), of a modulated signal in the %frequency domain


t = -4:.001:4;                %Define the time range
w = -10:.001:10;    	      %Define the frequency range

wc = 15;				%Set wc = 15
n = 1;			      %Set counter = 1

c = cos(wc.*t);              		  %Define the cosine part of the integral
x0 = 0 | t >= 0 & t <= 2;    		  %Define the input function x(t)
x1 = 2*sinc((2*w)/(2*pi)).*exp(-i*w); %Define the True Fourier Transform X(w) 


%%%%%Modulator
for k = w,           	        %Loop through all values of w
    e = exp(-1i*t*k);           %Define the exponential part of the integral
    y(n) = trapz(t,x0.*e.*c);   %Calculate the integral
    n = n+1;                    %Add 1 to the index of the array
end


ang0 = angle(y);                 	%Calculate the angle of Y(w)
mag0 = abs(y);                   	%Calculate the magnitude of Y(w) 
ang1 = angle(x1);  			%Calculate the angle of X(w)
mag1 = abs(x1);    			%Calculate the magnitude X(w)


%%%%%Graph Magnitudes
subplot(211),					 %Open a subplot
plot(w,mag0,'o',w,mag1,'r'),  		 %Plot the magnitudes                                   
xlabel('Frequency in rad/sec');		 %Label x-axis
ylabel('Amplitude'); 				 %Label y-axis
title('Figure 1.1:  |X(w)| and |Y(w|');	 %Create Graph Title
legend('Modulated','Original')			 %Create legend

%%%%%Graph Angles
subplot(212),
plot w,ang0,'o',w,ang1,'r'),   %Open a subplot of both angles                                    
xlabel('Frequency in rad/sec');		  
ylabel('Amplitude'); 
title('Figure 1.2:  Ang{X(w)} and Ang{Y(w)}');
legend('Modulated','Original')
