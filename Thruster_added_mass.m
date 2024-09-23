function M_T = Thruster_added_mass(R, L, W, Rho)
    syms x

    % Surge direction added mass - m11 (using Prolate spheroid theory)
    L1 = L - 2 * R;  % length of a cylinder
    V = pi * R^2 * (L1 + (4/3) * R);  % Volume of the entire submarine body

    % Prolate spheroid parameters
    b = R;  % Smaller axis length
    a = (3 * V) / (4 * pi * b^2);  % Longer axis length
    mdf = (4/3) * Rho * pi * a * b^2;  % Mass of displaced fluid

    e = sqrt(1 - (b^2 / a^2));  % Eccentricity
    a0 = 2 * ((1 - e^2) / e^3) * ((0.5 * log((1 + e) / (1 - e))) - e);  % alpha0 coefficient

    % K-coefficient
    k1 = a0 / (2 - a0);

    % Added mass m11
    m11 = k1 * mdf;

    % Other added masses (using Slender Body theory)
    a22 = 0; % Negligible effect compared to submarine value
    a33 = Rho * pi * (L1/2)^2;
    a44 = Rho * pi * (W/2)^2;
    a55 = a33;
    a66 = 0; % Same as a22

    % Added mass m22
    m22 = a22;

    % Added mass m33
    I1 = x / x;
    q1 = int(I1, x, -W/2, W/2);
    m33 = a33 * q1;

    % Added mass m44
    I2 = x^2;
    q2 = int(I2, x, -L1/2, L1/2);
    m44 = a44 * q2;

    % Added mass m55
    Ir3 = x^2;
    q3 = int(Ir3, x, -W/2, W/2);
    m55 = a55 * q3;

    % Added mass m66
    m66 = a66;

    % Added mass matrix
    M_T = double([m11, 0, 0, 0, 0, 0;
                  0, m22, 0, 0, 0, 0;
                  0, 0, m33, 0, 0, 0;
                  0, 0, 0, m44, 0, 0;
                  0, 0, 0, 0, m55, 0;
                  0, 0, 0, 0, 0, m66]);

end
