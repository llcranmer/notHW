%% 1. Plot Bob's recorded signa from t=0 to t=1.5s 

t = 0:0.001:1.5;
dt = t(2)-t(1);
s = sin(2*pi*t); 
figure(1),plot(t,s) 
%% 2. Periodic signal Bob 
t = linspace (-3,3,6004); %% same size as t in p 1
dt = t(2) - t(1);
S_bob = repmat(s, [1,4]) %% function is repeated 4 times in increments of 1.5 which is the period 
figure(2);plot(t,S_bob)

%% 3 Discrete angular frequencies (Bob) 

t = 0:0.001:1.5 
s; 
Ts = 1.5; 
figure(3);
    hold on 
    plot(t,s); 
for n = 1:5
    w_n = (n*2*pi) / Ts; 
    sb =sin(w_n*t); 
    plot(t,sb) 
end 
w_n;
%% 4 Coefficients of Bob 
t = 0:0.001:1.5; 
dt = t(2)-t(1); 
s = sin(2*pi*t); 
a0 =  sum(s) * dt; 
S_Bob = 0; 
S_Bob = S_Bob + a0;
figure(4) 
    hold on; 
    plot(t, s); 
for i = 1:4 % This variable yields both coefficents to the factor of 4 
    a(i) = sum(s.*cos(2*pi*i*t)*dt)/sum(cos(2*pi*i*t).^2*dt); 
    
    b(i) = sum(s.*sin(2*pi*i*t)*dt)/sum(sin(2*pi*i*t).^2*dt); 
    
    S_Bob = S_Bob+a(i)*cos(2*pi*i*t) + b(i)*sin(2*pi*i*t); 
    
    plot(t,S_Bob); 
end 

a
b



%% Plot Alice's continous signal 
t=[0:0.001:2];
dt= t(2)-t(1);
s= sin(2*pi*t);
figure(5), plot(t,s);
%% 6 Periodic Signal Alice 

t=linspace(-4,4,8004);
dt= t(2)-t(1);
S_alice=repmat(s, [1,4]); % the function is repeated 4 times in
% increments  of 2 which is the period
figure(6), plot(t,S_alice);
%% 7 Discrete Angular Frequencies 
t = 0:0.001:2; 
s; 
Ts = 2; 
figure(7); 
    hold on 
    plot(t,s); 
for n = 1:5
    w(n) = (n*2*pi)/Ts;
    sa = sin(w(n)*t); 
    plot(t,sa);
end 
w 
%% 8 Coefficients Alice 
t=[0:0.001:2];
dt= t(2)-t(1);
s=sin(2*pi*t);
a0=sum(s)*dt; % initial coefficient (a0)
S_Alice=0;
S_Alice=S_Alice+a0;
figure(8)
hold on;
plot (t,s);
for i= 1:8 % this yields both coeffiecients to the factor of 8
a(i)=sum(s.*cos(2*pi*i*t)*dt)/sum(cos(2*pi*i*t).^2*dt); % a
coefficients
b(i)=sum(s.*sin(2*pi*i*t)*dt)/sum(sin(2*pi*i*t).^2*dt); % b
coefficients
S_Alice=S_Alice+a(i)*cos(2*pi*i*t)+b(i)*sin(2*pi*i*t);
plot(t,S_Alice);
end
a
b


