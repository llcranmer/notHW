%% Lab 12


% Question 1 

set(0,'defaultAxesFontSize', 18);
set(0,'defaultlinelinewidth',2);

%% Define parameters
nl = 100; %number of layers 
thickness = 0.5; %thickness of each layer 
H = thickness*ones(1, nl); % define 10 layers with thickness of 2km
C = linspace(7, 11, length(H)); % define velocity in 10 layers from 1km/s to 10km/s
theta = 5:5:80;


%% background color
x2 = 0:250; 
z2 = cumsum(H)-H(1);
 
nx = numel(x2)
 
for i = 1:length(z2)
    
        c(i,1:nx) = C(i);
end

[xc,zc] = meshgrid(x2, z2);
figure;
title("Layer model")
pcolor(xc, zc, c); shading flat; colormap jet; colorbar('Direction','reverse');
set(gca,'ydir','reverse'); 

hold on
for itheta = 1:length(theta)
    
    p = sind(theta(itheta))/7; 
    x = 0;
    z = 0;
    for ithlayer = 2:length(H)-1
        theta_n = asind(p * C(ithlayer));
        x(ithlayer) = x(ithlayer-1) + H(ithlayer) * tand(theta_n);
        z(ithlayer) = z(ithlayer-1) + H(ithlayer); 
        if p > (1/C(ithlayer+1))
            break;
        end
    end 
title("Ray tracing in medium")
ylabel("Depth (km)")
xlabel("X (km)")    
plot(x, z, 'k')
plot(2*x(end)-x(end:-1:1),z(end:-1:1) , 'k')
end
hold off

%% QUESTION 2
% yes, you can use one 

%Creating a structural element 


%% Structure array 
for i = 1:length(H)
    layer(i).H = H(i); 
    layer(i).C = C(i); 
end
%%

x2 = 0:250; 
z2 = cumsum(H)-H(1);
 
nx = numel(x2)
 
for i = 1:length(z2)
    
        c(i,1:nx) = C(i);
end

[xc,zc] = meshgrid(x2, z2);
figure;
title("Model")
pcolor(xc, zc, c); shading flat; colormap jet; colorbar('Direction','reverse');
set(gca,'ydir','reverse'); hold on



% plotting using a structure array 
for itheta = 1:length(theta)
    
    p = sind(theta(itheta))/7; 
    x = 0;
    z = 0;
    clear layer; 
    layer(1).x = 0;
    layer(1).z = 0;
    H0 = 0.5;
    for ithlayer = 2:length(H)-1
        theta_n = asind(p * C(ithlayer));
        
        layer.x(ithlayer) = layer.x(ithlayer-1) + H0 * tand(theta_n);
        layer.z(ithlayer) = layer.z(ithlayer-1) + H0; 
       
        if p > (1/C(ithlayer+1))
            break;
        end
    end 
hold on   
title("Raytracing in Medium")
ylabel("Depth (km)")
xlabel("X (km)")
plot([layer(:).x], [layer(:).z], 'k')
plot((2*[layer.x(end)]-[layer.x(end:-1:1)]), [layer.z(end:-1:1)] , 'k')
end

%% bonus 

% Define parameters
nl = 100; %number of layers 
thickness = 0.5; %thickness of each layer 
H = thickness*ones(1, nl); % define 10 layers with thickness of 2km
C = linspace(7, 11, length(H)); % define velocity in 10 layers from 1km/s to 10km/s

theta = 5:5:80;

% Background color
x2 = 0:250; 
z2 = cumsum(H)-H(1);
 
nx = numel(x2)
 
for i = 1:length(z2)
    
        c(i,1:nx) = C(i);
end
hold on
title("Model")
[xc,zc] = meshgrid(x2, z2);
figure;
pcolor(xc, zc, c); shading flat; colormap jet; colorbar('Direction','reverse');
set(gca,'ydir','reverse'); 

%% bonus begin 
theta = 5:5:90;
% layer with some thickness
H(101) = 5;
% layer with some low velocity 
C(101) = 2;

for i = 1:length(H)
    layer(i).H = H(i); 
    layer(i).C = C(i); 
end

%plotting using a structure arrary 
for itheta = 1:length(theta)
    
    p = sind(theta(itheta))/7; 
    x = 0;
    z = 0;
    clear layer; 
    layer(1).x = 0;
    layer(1).z = 0;
    ray(1).X = 0; 
    ray(1).Z = 0; 
    ray(1).T = 0; 
    
    for ithlayer = 2:length(H)-1
        theta_n = asind(p * C(ithlayer));
        
        layer.x(ithlayer) = layer.x(ithlayer-1) + H(ithlayer-1) * tand(theta_n);
        layer.z(ithlayer) = layer.z(ithlayer-1) + H(ithlayer-1); 
        
        ray.X(ithlayer) = layer.x(ithlayer);  
        ray.Z(ithlayer) = layer.z(ithlayer);
        ray.T(ithlayer) = sqrt((ray.X(ithlayer).^2 + ray.Z(ithlayer).^2))/C(ithlayer);
  
        if p > (1/C(ithlayer+1))
            break;
        end
    end 
hold on   
title("Raytime curve")
ylabel("Depth (km)")
xlabel("X (km)")
plot([layer(:).x], [layer(:).z], 'k')
plot((2*[layer.x(end)]-[layer.x(end:-1:1)]), [layer.z(end:-1:1)] , 'k')
end

