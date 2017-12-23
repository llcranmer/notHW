%% QUESTION 1 
clearvars; close all; clc; 

% Define time-domain signals 
dt = 0.05; % s; sampling integral in time 
N = 1024; % Number of samples 
t = (-N/2+1:N/2)*dt  % time axis 
T = N*dt; % Total time length of the signal; i.e., period 
df = 1/T; % frequencey interval in Hz 
dw = 2*pi*df; % angular ferquencey interval rad/s

% Define Gaussian Function 
t0=0; a=1; % position of the Gaussian 
f = exp(-(t-t0).^2/a^2); % controls the width of the Gaussian 

% Do fft from time domain to frequency domain 
Fw = N*dt*ifft(f); 
w = [0:N/2, -N/2+1:-1]*dw; 

% Do ifft from frequency domain to time domain 
ft = fft(Fw)*dw/(2*pi); 

% Plot Gaussian function in time and frequency domain 
figure; 
subplot(1,2,1); 
plot(t,f,'k-', 'linewidth', 1.5); 
hold on; 
plot(t,real(ft),'r-.', 'linewidth', 1.5); 
ylim([min(f),max(f)]); 
xlabel('time (s)');ylabel('Amplitude'); 
subplot(1,2,2); 
freq = [-N/2+1:-1,0:N/2]*df; 
Fw1 = Fw([N/2+1:N,1:N/2]); 
plot(freq, abs(Fw1), 'r', 'linewidth',1.5); 
xlabel('frequency (Hz)');ylabel('Spectrum Amplitude'); 


% Define time-domain signals 
dt = 0.05; % s; sampling integral in time 
N = 1024; % Number of samples 
t = (-N/2+1:N/2)*dt  % time axis 
T = N*dt; % Total time length of the signal; i.e., period 
df = 1/T; % frequencey interval in Hz 
dw = 2*pi*df; % angular ferquencey interval rad/s

% Define Gaussian Function 
t0=0; a=56; % position of the Gaussian 
f = exp(-(t-t0).^2/a^2); % controls the width of the Gaussian 

% Do fft from time domain to frequency domain 
Fw = N*dt*ifft(f); 
w = [0:N/2, -N/2+1:-1]*dw; 

% Do ifft from frequency domain to time domain 
ft = fft(Fw)*dw/(2*pi); 

% Plot Gaussian function in time and frequency domain 
figure; 
subplot(1,2,1); 
plot(t,f,'k-', 'linewidth', 1.5); 
 
plot(t,real(ft),'r-.', 'linewidth', 1.5); 
ylim([min(f),max(f)]); 
xlabel('time (s)');ylabel('Amplitude'); 
subplot(1,2,2); 
freq = [-N/2+1:-1,0:N/2]*df; 
Fw1 = Fw([N/2+1:N,1:N/2]); 
plot(freq, abs(Fw1), 'r', 'linewidth',1.5); 
xlabel('frequency (Hz)');ylabel('Spectrum Amplitude'); 
hold off; 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%QUESTION 1%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% After you shift Gaussian signal (change t0), will the
% spectrum change? 

% No, the spectrum amplitude will not change. 


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%QUESTION 2%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% After change the width of Gaussian signal (change a), will the 
% spectrum change? 

% Yes, the spectrum amplitude will change. 


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%QUESTION 3%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Can you do derivative in frequency domain by multilpy 
% -iw? 
% transform your result back to time domain. Check if you 
% got the same result as you dor derivative in the itme domain. 


