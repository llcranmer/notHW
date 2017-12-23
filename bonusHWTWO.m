clear all; 
close all; 
clc; 
beep off; 

%% Compute the fourier coefficients 
t = [-pi:0.01:pi];
dt = t(2) - t(1);
y = square(t);
x = 0;
x = x+y; 
figure(1); plot(t,y); 
for i=1:2:5
    b(i) = sum(y.*sin(2*pi*i*t)*dt/sum(sin(2*pi*i*t).^2*dt));
    y = x + b(i)*sin(2*pi*i*t); 
    figure(2); plot(t,y); 
end 

% The coefficients 
b 

%% Question 2 Adding more terms 
t = [-pi:0.01:pi];
dt = t(2) - t(1);
y = square(t);
x = 0; 
x=x+y;
figure(2); plot(t,y); 
for i=1:2:40
    b(i) = sum(y.*sin(2*pi*i*t)*dt/sum(sin(2*pi*i*t).^2*dt));
    y = x + b(i)*sin(2*pi*i*t); 
    figure(2); plot(t,y); 
end 

% Adding more terms reducse the overshoot fit to the graph, which makes the
% Fourier Sine series get closer to the original function. To eliminate the
% overshoot completely  then let t => infinity. 


%% Question 3 Magnitude of overshooting 

