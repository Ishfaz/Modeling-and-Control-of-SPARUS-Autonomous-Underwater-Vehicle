% Constants
Re = 100000;  % Reynolds number for turbulent flow
V = 1;  % velocity, arbitrary
Rho = 1000;  % density
L = 1.6;  % total length of the submarine
R = 0.115;  % radius of the submarine

Cd_long_x = 0.1125;  % because L/2R ~ 7, it has to be between 0.1 and 0.15
Cd_lateral_y = 0.8;  % because cylindrical rod.
Cd_Z = Cd_lateral_y;  % because of symmetry

% Initialize the zeros matrix
K_cd = zeros(6, 6);

% To calculate the drag coefficients, we use two things: the projected surfaces for K11, K22, and K33;
% and the coefficients of drag, as well as the friction coefficient
Sx = pi * R^2;  % symbols are same as per the provided document

K_cd(1, 1) = 0.5 * Rho * Sx * Cd_long_x;
K_cd(2, 2) = 0.5 * Rho * L * R * Cd_lateral_y;
K_cd(3, 3) = 0.5 * Rho * L * R * Cd_Z;  % same as in y because of symmetry
K_cd(4, 4) =  0; % 1/64*Rho*R^4*L*Cd_long_x
K_cd(5, 5) = 1/64 * Rho * L^4 * R * Cd_Z;
K_cd(6, 6) = K_cd(5, 5);  % symmetry

% Display K_cd
disp(K_cd);