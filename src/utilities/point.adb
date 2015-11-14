package body point is
    function to_string (point : point_t) return string is
    begin
        return "[ " & float'image(point.x) & ", " & float'image(point.y) & " ]";
    end;

    -- Fonction permettant l'incrémentation de la coordonnée x d'un point
    procedure mv_x(point : in out point_t; delta_x : float) is
    begin
        if point.x + delta_x < 0.0 then
            raise invalid_pos with "x=" & float'image(point.x) & " + " & float'image(delta_x) & " < 0";
        end if;

        point.x := point.x + delta_x;
    end;

    -- Fonction permettant l'incrémentation de la coordonnée y d'un point
    procedure mv_y(point : in out point_t; delta_y : float) is
    begin
        if point.y + delta_y < 0.0 then
            raise invalid_pos with "y=" & float'image(point.y) & " + " & float'image(delta_y) & " < 0";
        end if;

        point.y := point.y + delta_y;
    end;
end point;
