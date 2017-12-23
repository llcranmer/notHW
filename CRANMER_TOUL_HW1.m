% HOMEWORK 1
% TOUL CRANMER 
% PSID: 1481673

%% PROBLEM 1: FOURIER SERIES 

T = 1;
x = -1:0.001:0;
f1 = (mod(x,T)) - 1/2;
plot(x,f1)
xlabel('Time')
ylabel('Periodic signal ')


%% PART 1.2 SCATTER PLOT
% graph it over -3 <= t < 3
T = 1; % period
x = -3:0.001:2;
% original function is f= t - 1/2 which repeated every T second, then
f2 = (mod(x,T)) - 1/2;
scatter(x,f2) % scatter because the signal is periodic 
xlabel('Time'); 
ylabel('Periodic Signal');

%% PART 1.2B REGULAR PLOT
% graph it over -3 <= t < 3
T = 1; % period
x = -3:0.001:2;
% original function is f= t - 1/2 which repeated every T second, then
f2 = (mod(x,T)) - 1/2;
plot(x,f2) % scatter because the signal is periodic 
xlabel('Time'); 
ylabel('Periodic Signal');



%% PART 1.3 Calculate the fourier coefficients a's and b's and graph
% following truncated summation of the fourier series 
% compare it to f(t) in P1.2 
x = -3:0.001:2;
t = [-3:0.001:2];
w = 2*pi; % angular frequency 
y = cos(w*t); % cosine function 
dt = t(length(t)) - t(1); 
yData = (mod(x,T)) - 1/2; 

a_0 = sum(yData)*dt; % The first term 

a_coeff = zeros(1,length(t)); 
b_coeff = zeros(1,length(t)); 

for n = 1:length(t)
    
    % CALCULATING THE COSINE COEFFICIENTS 
    a_n = yData.*cos(2*pi*n*t); % integrand for cosine
    cos_int = sum(a_n)*dt; %integrating the cosine integrand
    
    cos_denom = sum(cos(2*pi*n*t).^2)*dt; % denominator
    a_n = cos_int / cos_denom; % calculating the cosine coefficient 
    a_coeff(n) = a_n; % adding to a sine coeff  array 
    
    
    % CALCULATING THE SINE COEFFICIENTS 
        
    b_n = yData.*sin(2*pi*n*t);
    sin_int = sum(b_n)*dt; % integrating the sine integrand
    sin_denom = sum(sin(2*pi*n*t).^2)*dt; % calc sine denominator
    b_n =  sin_int / sin_denom; % calculating the sine coefficient
    b_coeff(n) = b_n; % adding to sine coeff array

end

fourier_series = zeros(1,length(t));
fourier_series = fourier_series + a_0; % Adding the first term to the array 


for n=1:length(t)
    cosine_p_sine = a_coeff(n)*cos(2*pi*n*t) + b_coeff(n)*sin(2*pi*n*t); % adding the parts 
    fourier_series = fourier_series + cosine_p_sine; 
   
end
%%

x = -3:0.001:2;
w = 2*pi; % angular frequency 
y = cos(w*t); % cosine function 
dt = t(length(t)) - t(1); 
yData = (mod(x,T)) - 1/2; 
a_0 = sum(yData)*dt; % The first term 
a_coeff = zeros(1,length(t)); 
b_coeff = zeros(1,length(t)); 

b=zeros(50,1);
for k=1:50
 % CALCULATING THE COSINE COEFFICIENTS 
    a_n = yData.*cos(2*pi*n*t); % integrand for cosine
    cos_int = sum(a_n)*dt; %integrating the cosine integrand
    
    cos_denom = sum(cos(2*pi*n*t).^2)*dt; % denominator
    a_n = cos_int / cos_denom; % calculating the cosine coefficient 
    a_coeff(n) = a_n; % adding to a sine coeff  array 
    
    
    % CALCULATING THE SINE COEFFICIENTS 
        
    b_n = yData.*sin(2*pi*n*t);
    sin_int = sum(b_n)*dt; % integrating the sine integrand
    sin_denom = sum(sin(2*pi*n*t).^2)*dt; % calc sine denominator
    b_n =  sin_int / sin_denom; % calculating the sine coefficient
    b_coeff(n) = b_n; % adding to sine coeff array
end


t=0:0.01:pi;
S50=zeros(1,length(t));
for k=1:50
S50=S50+b(k)*sin(k*t);
end
plot(t,S50)

S50=sum(repmat(b(1:50),1,length(t)).*sin((1:50)'*t))
repmat( x , fourier_series,  'r'); 



plot(x, fourier_series,'r');
xlabel('Time')
ylabel('Fourier Valiue')


fourier_series = zeros(1,length(t));
fourier_series = fourier_series + a_0; % Adding the first term to the array 


for n=1:length(t)
    cosine_p_sine = a_coeff(n)*cos(2*pi*n*t) + b_coeff(n)*sin(2*pi*n*t); % adding the parts 
    fourier_series = fourier_series + cosine_p_sine; 
   
end












%% PART 3.2
i = sqrt(-1);
t = [0 : 1: 8];
w = pi / 4; 
w_2 = pi / 5;

z = exp(i * w * t);
real_z = real(z);
imag_z = imag(z);


z2 = exp(i * w + i*w_2*t);
real_z2 = real(z2);
imag_z2 = imag(z2);


% PART 3.3
% at t = 5s and t = 1s
plot(real_z, imag_z,'r*',real_z2, imag_z2, 'bo');axis equal; 
xlabel('Real');
ylabel('Imaginary');

%% PART 3.4
i = sqrt(-1);
t = [0 : 1: 8];
w = pi / 4; 

z = exp(i * w * t);
z2 = exp(-1 * i * w * t);
cos_t = (z + z2)/2
real_cost = real(cos_t)

plot(t, real_cost,'r*')
xlabel('Time');
ylabel('cos(wt)');
 %% PART 4.2
 
earthHF = 0.08; % watt/m^2
earthR = 6378000; % meters 
earthSA = earthR^2 * 4 * pi; % m^2 
earth1s = earthHF * earthSA % m^2 * watt/m^2 => watts = joules / second

oneYear = 3.154 * 10^7 

earthRad1Year = oneYear * earth1s 

%% REPMAT STUFF 
T = 16;
T1 = 4;
Nvec = [ 5, 21, 101, 501]; %% samples vector 

% The time samples at which we evaluate
% the signal.
dt = 1/100;
t = ( -T/2 : dt : +T/2 )';
Nt = length(t);

for N = Nvec

  k = ( -N : 1 : +N );

  % Define the sin function that makes up the
  % series' weights. We need to catch the case
  % where the denominator is 0 and set it
  % to 1 (L'Hopital's rule).
  zinds = ( k == 0 );
  a = sin( k * 2*pi/T * T1 ) ./ (k*pi);
  a(zinds) = 1;

  % Define the terms in the approximation and sum
  % them. The below will make the kth term in the
  % sum the kth column in a matrix. Then we sum
  % the matrix across the columns.
  x = sum( repmat(a, Nt, 1)...
    .* exp(1j .* repmat(k,Nt,1) .* 2*pi/T .* repmat(t,1,length(k))), 2 );

  % Plot the resulting approximation.
  figure;
  plot( t, abs( x ), 'k' );
  title( sprintf( 'N = %d', N ) );

end



%% 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Approximating a pulse with 50% Duty Cycle using
% Fourier Series
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clc;
close all;
XLimit =20;
X_Discont = 10;
N_Coeff = [ 5, 20, 50,100];
step = 1/100;
x = ( -XLimit/2 : step : XLimit/2 )';
len = length(x);
location1=find(x==-5);
location2=find(x==5);
function_signal=ones(1,length(x));
function_signal(1:location1)=0;
function_signal(location2:end)=0;
iter=1;

for N = N_Coeff
    k =-N :1:N;
    index = ( k == 0 );
    a =sin( k * 1*(pi) * X_Discont/XLimit ) ./ (k*pi);
    a(index) = 1;
    fourier_signal = sum( repmat(a, len, 1)...
    .* exp(1j .* repmat(k,len,1) .* 2*pi/XLimit .* repmat(x,1,length(k))), 2 );
    
figure (1);
    subplot(2,2,iter)
    hold on
plot( x, abs( fourier_signal ),'m','LineWidth',3 );
    title( sprintf( 'N = %d Fourier Coefficients Used', N ) );
    iter=iter+1;
end
%%
close all; clear all; clc;

% ============= (1) Time-domain Signal ============= %

% Frequency of the sine in Hertz
f_sine = 377;

% Period of the sine
T_sine = 1/f_sine;

% Create "Nsamps" equally-spaced points in time from 0 to T_sine
Nsamps = 16;
t = (0:Nsamps-1)*T_sine/Nsamps;

% Period between each sample of t
T_samp = t(2)-t(1);
f_samp = 1/T_samp; % Sampling frequency

% Create the sine signal at time points t
x = sin(2*pi*f_sine*t);

% Plot time-domain signal
figure();
plot(t,x);
title('Time-domain signal, x(t)');
xlabel('Time');
ylabel('Amplitude');
grid on; axis tight;

% ========== (2) Frequency-domain Signal =========== %

% Frequency difference between each frequency bin in spectrum
df = f_samp/Nsamps;

% All frequencies to plot in spectrum
f = df*(0:Nsamps-1);

% Discrete Fourier Transform (using FFT method)
Y = fft(x);

% Plot frequency spectrum...
figure();
% Magnitude part
subplot(2,1,1);
plot(f,abs(Y));
xlabel('Frequency (Hz)');
ylabel('Magnitude');
grid on;
% Phase part
subplot(2,1,2);
plot(f,unwrap(angle(Y))*180/pi); % in degrees (unwrapped)
xlabel('Frequency (Hz)');
ylabel('Phase (degrees)');
grid on;



