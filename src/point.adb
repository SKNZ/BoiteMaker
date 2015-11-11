package body point is
    function to_string (point : point_t) return string is
    begin
        return "[ " & float'image(point.x) & ", " & float'image(point.y) & " ]";
    end;

    -- Fonction permettant l'incrémentation de la coordonnée x d'un point
    procedure incr_x(point : in out point_t; delta_x : float) is
    begin
        if point.x + delta_x < 0.0 then
            raise invalid_pos with "x=" & float'image(point.x) & " + " & float'image(delta_x) & " < 0";
        end if;

        point.x := point.x + delta_x;
    end;

    -- Fonction permettant l'incrémentation de la coordonnée y d'un point
    procedure incr_y(point : in out point_t; delta_y : float) is
    begin
        if point.y + delta_y < 0.0 then
            raise invalid_pos with "y=" & float'image(point.y) & " + " & float'image(delta_y) & " < 0";
        end if;

        point.y := point.y + delta_y;
    end;

    -- fonction generique appliquant un facteur (-1 ou 1 ici)
    -- à un delta passé à une procédure passé en tant que param. de genéricité 
    generic
        incr : access procedure (point : in out point_t; delta_axis : float);
        mult : integer;
    procedure float_mv(point : in out point_t; delta_axis : float);

    procedure float_mv(point : in out point_t; delta_axis : float) is 
    begin
        incr(point, delta_axis * float(mult));
    end;

    -- Instanciations des fonctions de mouvement
    -- en tant que internal_* pour éviter le message du compilateur
    -- instanciation cannot provide for body
    procedure internal_float_mv_l is new float_mv(incr_x'access, -1);
    procedure internal_float_mv_r is new float_mv(incr_x'access, 1);
    procedure internal_float_mv_u is new float_mv(incr_y'access, -1);
    procedure internal_float_mv_d is new float_mv(incr_y'access, 1);

    -- definition des fonctions de mouvement (celles-ci sont déclarées dans le package)
    procedure mv_l(point : in out point_t; delta_x : float) renames internal_float_mv_l;
    procedure mv_r(point : in out point_t; delta_x : float) renames internal_float_mv_r;
    procedure mv_u(point : in out point_t; delta_y : float) renames internal_float_mv_u;
    procedure mv_d(point : in out point_t; delta_y : float) renames internal_float_mv_d;

    -- fonction générique passant l'entier delta_axis en tant que float
    -- à la proceduré passée en paramètre de généricité
    generic
        mv : mv_ptr;
    procedure int_mv (point : in out point_t; delta_axis : integer);

    procedure int_mv (point : in out point_t; delta_axis : integer) is
    begin
        mv(point, float(delta_axis));
    end;

    -- Même chose que les fonctions du dessus mais acceptant un entier en paramètre
    procedure internal_int_mv_l is new int_mv(mv_l_ptr);
    procedure internal_int_mv_r is new int_mv(mv_r_ptr);
    procedure internal_int_mv_u is new int_mv(mv_u_ptr);
    procedure internal_int_mv_d is new int_mv(mv_d_ptr);

    -- definition des fonctions de mouvement avec int (celles-ci sont déclarées dans le package)
    procedure mv_l(point : in out point_t; delta_x : integer) renames internal_int_mv_l;
    procedure mv_r(point : in out point_t; delta_x : integer) renames internal_int_mv_r;
    procedure mv_u(point : in out point_t; delta_y : integer) renames internal_int_mv_u;
    procedure mv_d(point : in out point_t; delta_y : integer) renames internal_int_mv_d;
end point;
