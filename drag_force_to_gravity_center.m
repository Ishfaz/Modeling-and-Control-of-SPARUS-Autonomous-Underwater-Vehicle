function Fg = drag_force_to_gravity_center(r, F)
    Zero_mat = zeros(3, 3);
    Id_mat = eye(3);

    S_r = [0, -r(3), r(2);
           r(3), 0, -r(1);
           -r(2), r(1), 0];

    H = [Id_mat, S_r'; Zero_mat, Id_mat];
    HT = H';

    Fg = HT * F;
end
