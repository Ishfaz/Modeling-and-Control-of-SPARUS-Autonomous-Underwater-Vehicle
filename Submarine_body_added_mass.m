function M_SB = Submarine_body_added_mass(R, L, Rho)
    syms x L1

    % Surge direction added mass - m11 (using Prolate spheroid theory)
    L1 = L - 2 * R;
    V = pi * R^2 * (L1 + (4/3) * R);
    b = R;
    a = (3 * V) / (4 * pi * b^2);
    mdf = (4/3) * Rho * pi * a * b^2; % given in lecture notes page 117
    e = sqrt(1 - (b^2 / a^2));
    a0 = 2 * ((1 - e^2) / e^3) * ((0.5 * log((1 + e) / (1 - e))) - e);
    k1 = a0 / (2 - a0);
    m11 = k1 * mdf;

    % Other added masses (using Slender Body theory)
    a22 = Rho * pi * R^2;
    a33 = a22;
    a44 = 0;
    a55 = a33;
    a66 = a22;

    % Integration coefficients
    I1 = 1 - (((x + L1/2)^2) / R^2);
    I2 = 1;                                  % (x/x)
    I3 = 1 - (((x - L1/2)^2) / R^2);

    q1 = int(I1, x, -(L1/2)-R, -L1/2);
    q2 = int(I2, x, -L1/2, L1/2);
    q3 = int(I3, x, L1/2, (L1/2) + R);

    m22 = a22 * (q1 + q2 + q3);

    m33 = a33 * (q1 + q2 + q3);

    m44 = a44 * (q1 + q2 + q3);

    I4 = x^2 * (1 - (((x + L1/2)^2) / R^2));
    I5 = x^2;
    I6 = x^2 * (1 - (((x - L1/2)^2) / R^2));

    q4 = int(I4, x, -(L1/2)-R, -L1/2);
    q5 = int(I5, x, -L1/2, L1/2);
    q6 = int(I6, x, L1/2, (L1/2) + R);

    m55 = a55 * (q4 + q5 + q6);

    m66 = a66 * (q4 + q5 + q6);

    % Added mass matrix
    M_SB = double([m11, 0, 0, 0, 0, 0;
                   0, m22, 0, 0, 0, 0;
                   0, 0, m33, 0, 0, 0;
                   0, 0, 0, m44, 0, 0;
                   0, 0, 0, 0, m55, 0;
                   0, 0, 0, 0, 0, m66]);

end
