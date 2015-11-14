package point is
    -- exception en cas de coordonnées invalides
    invalid_pos : exception;

    type point_t is
        record
            x, y : float := 0.0;
        end record;

    -- Bouge le point sur l'axe x
    procedure mv_x(point : in out point_t; delta_x : float);

    -- Bouge le point sur l'axe y
    procedure mv_y(point : in out point_t; delta_y : float);

    -- Pointeur de fonction vers une fonction de mv_*
    type mv_point_ptr is access procedure (point : in out point_t; delta_axis : float);

    -- Constantes pour les pointeurs de fonctions
    mv_x_ptr : constant mv_point_ptr := mv_x'access;
    mv_y_ptr : constant mv_point_ptr := mv_y'access;
    
    -- Représentation en texte du point
    function to_string(point : point_t) return string;

    private
end point;
