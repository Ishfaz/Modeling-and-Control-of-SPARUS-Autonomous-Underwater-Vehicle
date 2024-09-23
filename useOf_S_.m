% Input values
L = 1.6;   % Total length of the submarine
R = 0.115; % Radius of the submarine
m = 52;   % Submarine mass

W3 = 0.065;  % Width of the Antenna
H3 = 0.255;   % Height of the Antenna
T3 = 0.03;   % Thickness of the Antenna

Lth = 0.285;  % Approximate length of the thruster assembly
Rth = 0.045; % Approximate radius of the thruster assembly
Wth = 0.098; % Approximate width of the thruster assembly
Rho = 1000;

% Distance vectors
rg_SB = [0.0555, 0, 0];
rg_ANT = [-0.412, 0, -0.2425];
rg_RT = [-0.532, 0.148, 0];
rg_LT = [-0.532, -0.148, 0];

% Assuming Submarine_body_added_mass, Thruster_added_mass, Antenna_added_mass are already defined in MATLAB
Mb_SB = Submarine_body_added_mass(R, L, Rho);
Mg_SB = Move_to_CG(rg_SB, Mb_SB);
disp('Added Mass Matrix - Submarine Body:');
disp(Mg_SB);

Mb_TL = Thruster_added_mass(Rth, Lth, Wth, Rho);
Mg_TL = Move_to_CG(rg_LT, Mb_TL);
disp('Added Mass Matrix - Thruster Left:');
disp(Mg_TL);

Mb_TR = Thruster_added_mass(Rth, Lth, Wth, Rho);
Mg_TR = Move_to_CG(rg_RT, Mb_TR);
disp('Added Mass Matrix - Thruster Right:');
disp(Mg_TR);

Mb_ANT = Antenna_added_mass(W3, H3, T3, Rho);
Mg_ANT = Move_to_CG(rg_ANT, Mb_ANT);
disp('Added Mass Matrix - Antenna:');
disp(Mg_ANT);

% Sum of all added mass matrices of thrusters
Mg_Thruster = Mg_TL + Mg_TR;
% Added mass matrix of all sub bodies
MCG = Mg_Thruster + Mg_ANT + Mg_SB;
disp('Added mass Matrix at the centre of gravity is:');
disp(MCG);
