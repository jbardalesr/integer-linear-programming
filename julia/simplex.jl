module Simplex
    function minimun_ration_test(col:: Vector, b:: Vector)
        r_min = 1
        min_val = Inf
        for k=1:size(b, 1)
            if col[k] > 0
                min_val_temp = b[k]/col[k]
                if min_val > min_val_temp
                    min_val = min_val_temp
                    r_min = k
                end
            end
        end
        return r_min
    end

    function pivoting(tableau:: Matrix, row:: Int64, col:: Int64)
        # scaled to 1
        tableau[row, :] = tableau[row, :]/tableau[row, col]
        for k=1:size(tableau, 1)
            if k != row
                tableau[k, :] = tableau[k, :] - tableau[k, col]*tableau[row, :]
            end
        end
        return tableau
    end

    function simplex(tableau:: Matrix, basic_indices:: Matrix)
        show(stdout, "text/plain", tableau)
        while any(tableau[1, 1:end - 1] .> 0)
            # max criterion
            c_max = argmax(tableau[1, 1:end - 1])
            # minimun-ratio-test
            r_min = minimun_ration_test(tableau[2:end, c_max], tableau[2:end, end])
            # pivoting
            tableau = pivoting(tableau, r_min + 1, c_max)
            # swap row with col
            basic_indices[r_min] = c_max
            show(stdout, "text/plain", tableau)
        end
    end
end