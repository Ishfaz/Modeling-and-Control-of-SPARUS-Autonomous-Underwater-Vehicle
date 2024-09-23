function Para=Parameters()

global Para
M = [ 52 0 0 0 -0.1 0;
      0 52 0 0.1 0 -1.3;
      0 0 52 0 1.3 0;
      0 .1 0 0.5 0 0;
      -0.1 0 1.3 0 9.4 0;
      0 -1.3 0 0 0 9.5;]
     
%% Initial Speed and position in Earth-fixed frame

Para.ICPos = [0 0 2 0 0 0];
Para.ICSpeed = [0 0 0 0 0 0] ;

%% General parameters
Para.rho_water = 1000 ;                     % Masse volumique de l'eau (kg/m^3)
Para.R = 0.115 ;                            % Sparus Radius (m)
Para.L = 1.6;  	                            % Sparus length (m)
Para.m = 52 ; 	                            % Sparus mass (kg)
Para.mb = 52.1;                           	% Sparus buoyancy mass  (kg) 
Para.g = 9.81 ;                             % Earth Gravity (m*s^(-2))
Para.P = Para.m * Para.g;	                % Sparus weight (N)
Para.B = Para.mb * Para.g;	                % Buoyancy (N)

%% Center of gravity and Buoyancy position in body-fied frame

Para.xg = 0 ;    %x-positon of Center of gravity
Para.yg = 0 ;    %y-positon of Center of gravity
Para.zg = 0 ;    %z-positon of Center of gravity

Para.rg = [Para.xg Para.yg Para.zg]' ;


Para.xb = 0      ;    % x-positon of Center of Buoyancy
Para.yb = 0      ;    % y-positon of Center of Buoyancy
Para.zb = -0.02  ;    % z-positon of Center of Buoyancy

Para.rb = [Para.xb Para.yb Para.zb]' ;

--------------------------------------------
%Thruster positions in body-fixed frame

Para.d1x = 0        ; 
Para.d1y = 0        ;
Para.d1z = 0.08     ;
Para.d2x = -0.59    ; 
Para.d2y = 0.17     ;
Para.d2z = 0        ;
Para.d3x = -0.59    ;
Para.d3y = -0.17    ;
Para.d3z = 0        ;

%% Body positions

% Main Body S0;
Para.S0.r=[0,0,0]'; % Position (m)
% Antenna S1;
Para.S1.r=[-0.412, 0, -0.2425]'; % Position (m)
% Thruster_RT S2;
Para.S2.r=[Para.d2x, Para.d2y, Para.d2z]'; % Position (m)
% Third Body S3: thruster 3;
Para.S3.r=[Para.d3x, Para.d3y, Para.d3z]'; % Position (m)



% %% Body Mass matrices
% 
% 
% % Main Body S0;
% Para.S0.m= 1; 
% Para.S0.I_xx = 1;    
% Para.S0.I_yy = 1;    
% Para.S0.I_zz = 1;    
% 
% Para.S0.Mb = -diag([Para.S0.m Para.S0.m Para.S0.m Para.S0.I_xx Para.S0.I_yy Para.S0.I_zz]) ; 
% 
% % Antenna _S1;
% Para.S1.m= 1; 
% Para.S1.I_xx = 1;    
% Para.S1.I_yy = 1;    
% Para.S1.I_zz = 1;    
% 
% Para.S1.Mb = -diag([Para.S1.m Para.S1.m Para.S1.m Para.S1.I_xx Para.S1.I_yy Para.S1.I_zz]) ; 
% 
% % Thruster RT S2;
% Para.S2.m= 1; 
% Para.S2.I_xx = 1;    
% Para.S2.I_yy = 1;    
% Para.S2.I_zz = 1;    
% 
% Para.S2.Mb = -diag([Para.S2.m Para.S2.m Para.S2.m Para.S2.I_xx Para.S2.I_yy Para.S2.I_zz]) ; 
% 
% % Thruster LT S3;
% Para.S3.m= 1; 
% Para.S3.I_xx = 1;    
% Para.S3.I_yy = 1;    
% Para.S3.I_zz = 1;    
% 
% Para.S3.Mb = -diag([Para.S3.m Para.S3.m Para.S3.m Para.S3.I_xx Para.S3.I_yy Para.S3.I_zz]) ; 

%% Body added Mass matrices

% Main Body S0;
Para.S0.ma_u = 1.323;    % surge
Para.S0.ma_v = 63.29;    % sway
Para.S0.ma_w = 63.29;    % heave
Para.S0.ma_p = 0;        % roll
Para.S0.ma_q = 12.28;    % pitch
Para.S0.ma_r = 12.28;    % yaw

Para.S0.Ma = -diag([Para.S0.ma_u Para.S0.ma_v Para.S0.ma_w Para.S0.ma_p Para.S0.ma_q Para.S0.ma_r]) ; 

% Antenna S1;
Para.S1.ma_u = 0.437;           % surge
Para.S1.ma_v = 1.322;           % sway
Para.S1.ma_w = 0.3801;          % heave
Para.S1.ma_p = 0.007448;        % roll
Para.S1.ma_q = 0.00246;         % pitch
Para.S1.ma_r = 0.0001735;       % yaw

Para.S1.Ma = -diag([Para.S1.ma_u Para.S1.ma_v Para.S1.ma_w Para.S1.ma_p Para.S1.ma_q Para.S1.ma_r]) ; 

% Truster_RT S2;
Para.S2.ma_u =0.126;     % surge
Para.S2.ma_v = 0;        % sway
Para.S2.ma_w = 2.434;    % heave
Para.S2.ma_p = 0.0036;   % roll
Para.S2.ma_q = 0.00227;  % pitch
Para.S2.ma_r = 0;        % yaw

Para.S2.Ma = -diag([Para.S2.ma_u Para.S2.ma_v Para.S2.ma_w Para.S2.ma_p Para.S2.ma_q Para.S2.ma_r]) ; 

% Thruster_LT S2;
Para.S3.ma_u =0.126;      % surge
Para.S3.ma_v = 0;         % sway
Para.S3.ma_w = 2.434;     % heave
Para.S3.ma_p = 0.0036;    % roll
Para.S3.ma_q = 0.00227;   % pitch
Para.S3.ma_r = 0;         % yaw

Para.S3.Ma = -diag([Para.S3.ma_u Para.S3.ma_v Para.S3.ma_w Para.S3.ma_p Para.S3.ma_q Para.S3.ma_r]) ; 

%% Generalized mass matrix

Para.S0.Mg = Para.S0.Mb + Para.S0.Ma ; 
Para.S1.Mg = Para.S1.Mb + Para.S1.Ma ;
Para.S2.Mg = Para.S2.Mb + Para.S2.Ma ;
Para.S3.Mg = Para.S3.Mb + Para.S3.Ma ;

Para.Mg = Para.S0.Mg + Para.S1.Mg + Para.S2.Mg +Para.S3.Mg+M;


%% Generalized coriolis matrix

% Computed in RovModel.m

%% Friction matrices

% Main Body S0;
Para.S0.kuu = 2.337;    % surge
Para.S0.kvv = 73.6;    % sway
Para.S0.kww = 73.6;    % heave
Para.S0.kpp = 0;    % roll
Para.S0.kqq = 9.4208;    % pitch
Para.S0.krr = 9.4208;    % yaw

Para.S0.Kq = -diag([Para.S0.kuu Para.S0.kvv Para.S0.kww Para.S0.kpp Para.S0.kqq Para.S0.krr]) ;    %Quadratic friction matrix

% Antenna S1;
Para.S1.kuu = 7.2;      % surge
Para.S1.kvv = 15.74;    % sway
Para.S1.kww = 2.43;     % heave
Para.S1.kpp = 0;        % roll
Para.S1.kqq = 8.15e-6;    % pitch
Para.S1.krr = 3.76e-6;    % yaw

Para.S1.Kq = -diag([Para.S1.kuu Para.S1.kvv Para.S1.kww Para.S1.kpp Para.S1.kqq Para.S1.krr]) ;    %Quadratic friction matrix


% Thruster_RT S1;
Para.S2.kuu = 2.326;    % surge
Para.S2.kvv = 24.9;    % sway
Para.S2.kww = 24.9;    % heave
Para.S2.kpp = 0;    % roll
Para.S2.kqq = 9.48e-3;    % pitch
Para.S2.krr = 9.483e-3;    % yaw

Para.S2.Kq = -diag([Para.S2.kuu Para.S2.kvv Para.S2.kww Para.S2.kpp Para.S2.kqq Para.S2.krr]) ;    %Quadratic friction matrix

% Thruster_LT  S2;
Para.S3.kuu = 2.326;    % surge
Para.S3.kvv = 24.9;    % sway
Para.S3.kww = 24.9;    % heave
Para.S3.kpp = 0;    % roll
Para.S3.kqq = 9.48e-3;    % pitch
Para.S3.krr = 9.48e-3;    % yaw

Para.S2.Kq = -diag([Para.S2.kuu Para.S2.kvv Para.S2.kww Para.S2.kpp Para.S2.kqq Para.S2.krr]) ;    %Quadratic friction matrix



%% Thruster modelling


Para.rt1 = [Para.d1x, Para.d1y, Para.d1z]' ;
Para.rt2 = [Para.d2x, Para.d2y, Para.d2z]' ;
Para.rt3 = [Para.d3x, Para.d3y, Para.d3z]' ;


Para.rt = [Para.rt1 Para.rt2 Para.rt3] ;

%Thruster gains

Para.kt1 = 28.5    ;
Para.kt2 = 30    ;
Para.kt3 = 30    ;


%Thruster gain vectors

Para.Kt=[Para.kt1;Para.kt2;Para.kt3];

%Thruster time constants

Para.Tau1 = 0.4 ;
Para.Tau2 = 0.8 ;
Para.Tau3 = 0.8 ;


%Thruster time constant vectors

Para.Tau = [Para.Tau1;Para.Tau2;Para.Tau3] ;

% Mapping of thruster

Para.Eb_F = [0 1 1; 0 0 0; 1 0 0];
    
Para.Eb_M = [0 0 0; 0 0 0; 0 -Para.d2y -Para.d3y] ;

Para.Eb = [ Para.Eb_F ; Para.Eb_M ] ;

% Inverse Mapping of thruster
Para.Ebinv = pinv(Para.Eb) ;

end





 
           
