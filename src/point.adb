package body point is
    function to_string (point : point_t) return string is
    begin
        return "[ " & float'image(point.x) & ", " & float'image(point.y) & " ]";
    end;

    procedure mv_l(point : in out point_t; delta_x : float) is
    begin
        if point.x - delta_x < 0.0 then
            raise invalid_pos with "x=" & float'image(point.x) & " - " & float'image(delta_x) & " < 0";
        end if;

        point.x := point.x - delta_x;
    end;

    procedure mv_r(point : in out point_t; delta_x : float) is
    begin
        if point.x + delta_x < 0.0 then
            raise invalid_pos with "x=" & float'image(point.x) & " - " & float'image(delta_x) & " < 0";
        end if;

        point.x := point.x + delta_x;
    end;
    
    procedure mv_u(point : in out point_t; delta_y : float) is
    begin
        if point.y - delta_y < 0.0 then
            raise invalid_pos with "y=" & float'image(point.y) & " - " & float'image(delta_y) & " < 0";
        end if;

        point.y := point.y - delta_y;
    end;

    procedure mv_d(point : in out point_t; delta_y : float) is
    begin
        if point.y + delta_y < 0.0 then
            raise invalid_pos with "y=" & float'image(point.y) & " - " & float'image(delta_y) & " < 0";
        end if;

        point.y := point.y + delta_y;
    end;

    -- la généricité, ou comment écrire 15 lignes de code obscure pour en éviter 16 simples.
    procedure int_mv (point : in out point_t; delta_axis : integer) is
    begin
        mv(point, float(delta_axis));
    end;

    -- Même choses que les fonctions du dessus mais acceptant un entier en paramètre
    procedure internal_mv_l is new int_mv(mv_l_ptr);
    procedure internal_mv_r is new int_mv(mv_r_ptr);
    procedure internal_mv_u is new int_mv(mv_u_ptr);
    procedure internal_mv_d is new int_mv(mv_d_ptr);

    procedure mv_l(point : in out point_t; delta_x : integer) renames internal_mv_l;
    procedure mv_r(point : in out point_t; delta_x : integer) renames internal_mv_r;
    procedure mv_u(point : in out point_t; delta_y : integer) renames internal_mv_u;
    procedure mv_d(point : in out point_t; delta_y : integer) renames internal_mv_d;
end point;
