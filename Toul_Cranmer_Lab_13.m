% build the stress tensor matrix
stressTensor = zeros(3,3);

% assign values to the tensor matrix
theta33 = 1; 
stressTensor(3,3) = theta33; 


% normal of the surface on which you wanna calculate strain 

normal = [0, sqrt(2)/2, sqrt(2)/2].'; %.' means transpose row vec to col vec

% matrix multiplies with vector to produces a traction vector 
traction = stressTensor*normal; 

%%
clear all; 
% QUESTION 1 
stressTensor = zeros(3,3); 
stressTensor(1,1) = 100 % mpa = z-axis
stressTensor(2,2) = 60 %mpa = y-axis 
stressTensor(3,3) = 40 % mpa = x - axis
nx = 0; 
nz = 0; 
ny = 0; 
n = zeros(3,1); 

% Question 2 
for theta = 1:360
   
    nx(theta) = cosd(theta);
    n(1) = nx(theta);
    
    ny(theta) = 0; 
    n(2) = ny(theta);
    
    
    nz(theta) = sind(theta);
    n(3) = nz(theta); 
%     normal = n.'; 
    T = stressTensor * n;
%     n = (nx, ny, nz)
    plot(nx,nz, 'k');
    
    normal_traction(theta) = dot(T,n);
    shear_traction(theta) = sqrt(sum(T.^2) - normal_traction(theta).^2);
%     tensor_vector(theta) = normal_traction + shear_traction;
    
   

    
end
theta = 1:1:360;
hold on
plot(theta, normal_traction, 'k')
plot(theta, shear_traction, 'x')

% QUESTION 2



