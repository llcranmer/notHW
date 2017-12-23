
%% TOUL CRANMER HOMEWORK 2 

% Driving vibroseis truck with vibating frequency = 1Hz 
% Ground shaking/displacement => s(t) = sin(2*pi*t)
% Can Alice or Bob figure out the Frequency from doing the 
% fourier analysis 

%% QUESTION 1: BOB non-perodic signal 
%% Time specifications:
Fs = 1000;                   % samples per second
dt = 1/Fs;                   % seconds per sample
StopTime = 1.5;              % seconds
t = (0:dt:StopTime-dt)';     % seconds
%% Sine wave:
Fc = 1;                     % hertz
x = sin(2*pi*Fc*t);
% Plot the signal versus time:
figure;
plot(t,x);
xlabel('time (in seconds)');
title('Signal versus Time');
zoom xon;
%% QUESTION 2: BOB periodic signal
%% Time specifications:
Fs = 1.5;                   % samples per second
dt = 1/Fs;                  % seconds per sample
StopTime = 3;               % seconds
t = (-3:dt:StopTime-dt)';   % seconds
%% Sine wave:
Fc = 1;                     % hertz
x = sin(2*pi*Fc*t);
% Plot the signal versus time:
figure;
plot(t,x);
xlabel('time (in seconds)');
title('Signal versus Time');
zoom xon;

T = 1;
x = -1:0.001:0;
f1 = (mod(x,T)) - 1/2;
%% QUESTION 3: Since Bob?s periodic signal has a period of 1.5s, what are the discrete

%  angular frequencies ?n in his Fourier series?

% wn = n * 2 * pi / T where T = 1.5 and n is in the set of integers 
%% QUESTION 4: Can you help Bob calculate a0 , a1 , a2 , a3, a4 and b1,b2 ,b3,b4 ? Plot the
%spectrum (an^2 +bn^2)^1/2 versus n for n=1,2,3,4
t = -3:0.001:3;
T = 1.5 
dt = t(end) - t(1);

yData = sin(2*pi*t);

a_0 = sum(yData)*dt; 

a_coeff = zeros(1,4);
b_coeff = zeros(1,4); 

for n=1:4 
    
    % Finding the a_n terms 
    a_n = yData.*cos(2*pi*n*t);
    fInt = sum(a_n)*dt;
    gInt = sum(cos(2*pi*n*t).^2)*dt;
    a_n = fInt / gInt; 
    a_coeff(n) = a_n
    
    % Finding the b_n terms 
    b_n = yData.*sin(2*pi*n*t);
    hInt = sum(b_n)*dt;
    iInt = sum(sin(2*pi*n*t).^2)*dt;
    
    b_n = hInt / iInt;
    b_coeff(n) = b_n 
end

disp(a_coeff)
disp(b_coeff) 

% Plotting the spectrum 
spectrum = sqrt(a_coeff.^2 + b_coeff.^2)
n = 1:1:4
wn = 2*pi*n/T
plot(spectrum, wn)
xlabel('Spectrum')
ylabel('Angular Frequencies') 

%% QUESTION 5 
Fs = 1000;                   % samples per second
dt = 1/Fs;                   % seconds per sample
StopTime = 2.0;              % seconds
t = (0:dt:StopTime-dt)';     % seconds
Fc = 1;                     % hertz
x = sin(2*pi*Fc*t);
% Plot the signal versus time:
figure;
plot(t,x);
xlabel('time (in seconds)');
title('Signal versus Time');
zoom xon;
%% QUESTION 6 
Fs = 2.0;                   % samples per second
dt = 1/Fs;                  % seconds per sample
StopTime = 4;               % seconds
t = (-4:dt:StopTime-dt)';   % seconds
%% Sine wave:
Fc = 1;                     % hertz
x = sin(2*pi*Fc*t);
% Plot the signal versus time:
figure;
plot(t,x);
xlabel('time (in seconds)');
title('Signal versus Time');
zoom xon;
%% QUESTION 7 
% wn = n*2*pi/T where T = 2s and n is in the set of integers 
%% QUESTION 8 
t = -4:0.001:4;
T = 2.0
dt = t(end) - t(1);

yData = sin(2*pi*t);

a_01 = sum(yData)*dt; 

a_coeff1 = zeros(1,8);
b_coeff1 = zeros(1,8); 

for n=1:8 
    
    % Finding the a_n terms 
    a_n = yData.*cos(2*pi*n*t);
    fInt = sum(a_n)*dt;
    gInt = sum(cos(2*pi*n*t).^2)*dt;
    a_n = fInt / gInt; 
    a_coeff1(n) = a_n
    
    % Finding the b_n terms 
    b_n = yData.*sin(2*pi*n*t);
    hInt = sum(b_n)*dt;
    iInt = sum(sin(2*pi*n*t).^2)*dt;
    
    b_n = hInt / iInt; 
    b_coeff1(n) = b_n 
end 
disp(a_coeff1)
disp(b_coeff1) 

% Plotting the spectrum
spectrum = sqrt(a_coeff1.^2 + b_coeff1.^2)
n = 1:1:8
wn = 2*pi*n/T
plot(spectrum, wn)
xlabel('Spectrum')
ylabel('Angular Frequencies') 

