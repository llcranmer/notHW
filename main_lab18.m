clearvars; close all; clc; 

%% Read data from SAC file:
file1 = rsac('COR_Z31A_Z35A.SAC');
file2 = rsac('COR_Z31A_Z39A.SAC');

t1 = file1(:,1); % time axis of the first seismogram
traceData1 = file1(:, 2); % first seismogram

t2 = file2(:,1); % time axis of the second seismogram
traceData2 = file2(:, 2); % second seismogram

%% Question 1 %% 
lon1 = -97.25; 
lat1 = 33.33;
lon2 = -94.18; 
lat2 = 33.24;

% this is the distance between the two stations 
[arclen,az] = distance(lat1,lon1,lat2,lon2)
distkm = distdim(arclen, 'deg', 'km')


%% QUESTION 2 %%; 

t_1 = t1(5001:5512);
traceCut1 = traceData1(5001:5512); 

t_2 = t2(5001:5512); 
traceCut2 = traceData2(5001:5512);

figure (1) 
subplot(2,1,1); 
plot( t_1, traceCut1, 'b'); 
xlabel('Time (s)'); 
ylabel('Amplitude'); 
title('Station 1');
hold on

subplot(2,1,2);
plot(t_2, traceCut2, 'b'); 
xlabel('Time (s)');
ylabel('Amplitude');
title('Station 2'); 


%% QUESTION 3

f= linspace(0.025, 0.075,80);
V = linspace(2.5, 5.5, 160);
dt = t1(2) - t1(1);
f1 = 0; 
f2 = f1+0.0075;

%
%velocity phase loop 
for i = 1:160
    Vphase = V(i);
    % time_lag = dist/Vphase
    time_lag = distkm/Vphase; 
 
    % cirshift
    d2 =  circshift(traceData1, round(time_lag));
    %frequency loop 
    for j = 1:80
        freq1 = f(j); 
        freq2 = f(j) + 0.0075;
        out2 = butterfiltering(d2, dt, freq1, freq2);
        out3 = butterfiltering(traceData2, dt, freq1, freq2);
        
        matrix(i,j) = xcorr(out2, out3, 0, 'coeff'); 
    
    end 
end
figure;
imagesc(f, V, matrix);
colormap jet; colorbar; 
set(gca, 'ydir', 'normal'); 
title('Dispersion Curve of Phase Velocity'); 
xlabel('Frequency (Hz)'); 
ylabel('Velocity (km/s)'); 
      

