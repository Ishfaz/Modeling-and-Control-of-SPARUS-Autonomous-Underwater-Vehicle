function M_ANT = Antenna_added_mass(W_A, H_A, T_A, Rho)
    if nargin < 4
        Rho = 1000; % Default value for Rho if not provided
    end

    syms x

    % Integration coefficients
    a11 = 1.7 * pi * Rho * (T_A/2)^2;  % ratio of T_A/W_A ~ 2
    a22 = 1.36 * pi * Rho * (W_A/2)^2;  % ratio of W_A/T_A ~ 0.5
    a33 = 0.19 * pi * Rho * W_A * T_A;
    a44 = a22;
    a55 = a11;
    a66 = 0.15 * pi * Rho * (W_A/2)^4;

    % Added mass m11
    I1 = x / x;
    q1 = int(I1, x, -H_A/2, H_A/2);
    m11 = a11 * q1;

    % Added mass m22
    m22 = a22 * q1;

    % Added mass m33
    I3 = x / x;  % Check if this is the correct shape function for integration
    q3 = int(I3, x, -H_A/2, H_A/2);
    m33 = a33 * q3;

    % Added mass m44
    I2 = x^2;
    q2 = int(I2, x, -H_A/2, H_A/2);
    m44 = a44 * q2;

    % Added mass m55
    m55 = a55 * q2;

    % Computing m66
    m66 = a66 * q1;

    % Added mass matrix
    M_ANT = double([m11, 0, 0, 0, 0, 0;
                    0, m22, 0, 0, 0, 0;
                    0, 0, m33, 0, 0, 0;
                    0, 0, 0, m44, 0, 0;
                    0, 0, 0, 0, m55, 0;
                    0, 0, 0, 0, 0, m66]);

end