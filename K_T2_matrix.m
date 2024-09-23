% Constants for thruster 1 and thruster 2
L_T = 0.285;  % Approximate length of the thruster assembly
R_T = 0.046;  % Approximate radius of the thruster assembly

Rho = 1000;  % density

% thruster 1
Cd_surge_T1 = 0.7;  % because L_T/2R_T = 3.09
Cd_sway_T1 = 1.9;  % because plate 2R_T/L_T = 0.16
Cd_heave_T1 = 1.9;  % because plate

% Surface areas
Surf_surge = pi * R_T^2;
Surf_sway = 2 * R_T * L_T;
Surf_heave = 2 * R_T * L_T;

% Initialize an empty matrix for thruster 1
K_T1 = zeros(6, 6);

% Calculate the drag coefficients
K_T1(1, 1) = 0.5 * Rho * Surf_surge * Cd_surge_T1;
K_T1(2, 2) = 0.5 * Rho * Surf_sway * Cd_sway_T1;
K_T1(3, 3) = 0.5 * Rho * Surf_heave * Cd_heave_T1;
K_T1(4, 4) = 0;
K_T1(5, 5) = 1/64 * Rho * Surf_heave * L_T^3;
K_T1(6, 6) = 1/64 * Rho * Surf_heave * L_T^3;

% Display the K_T1 matrix
K_T1 = -K_T1;
disp('K_T1:');
disp(K_T1);

% thruster 2
K_T2 = K_T1; % it is the same for thruster two as they are of the same dimensions

% Display the K_T2 matrix
disp('\nK_T2:');
disp(K_T2);
