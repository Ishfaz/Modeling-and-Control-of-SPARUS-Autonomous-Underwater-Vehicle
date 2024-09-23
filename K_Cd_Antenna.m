% Constants for Antenna
W_A = 0.03;  % Width of the Antenna
H_A = 0.255;  % Height of the Antenna
T_A = 0.065; % Thickness of the Antenna

Cd_surge = 1.9; % because T_A/H_A ~ 0.2165 close to 0.1
Cd_sway = 1.9;  % because W_A/H_A ~ 0.117 close to 0.1
Cd_heave = 2.5;  % because W_A/T_A ~ 0.46 close to 0.5

rho = 1000;  % density

% Initialize an empty K matrix
K_cd_A = zeros(6, 6);

% Surface areas
Surf_1 = H_A * W_A;
Surf_2 = H_A * T_A;
Surf_3 = W_A * T_A;

% Calculate the drag coefficients
K_cd_A(1, 1) = 0.5 * rho * Surf_1 * Cd_surge;
K_cd_A(2, 2) = 0.5 * rho * Surf_2 * Cd_sway;
K_cd_A(3, 3) = 0.5 * rho * Surf_3 * Cd_heave;
K_cd_A(4, 4) = 0;
K_cd_A(5, 5) = 1/64 * Cd_sway * H_A^4 * T_A;
K_cd_A(6, 6) = 1/64 * Cd_sway * H_A^4 * W_A;

% Display the K_antenna matrix
disp('K_Cd_Antenna:');
disp(K_cd_A);
