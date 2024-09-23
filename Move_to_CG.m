function M_CG = Move_to_CG(r, M)
    OO = zeros(3, 3);
    Id = eye(3);

    H = [Id, S_(r)'; OO, Id];
    HT = H';

    M_CG = HT * M * H;
end