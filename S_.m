function vector_Skew_M = S_(rg)
    vector_Skew_M = [0, -rg(3), rg(2);
                     rg(3), 0, -rg(1);
                     -rg(2), rg(1), 0];
end


