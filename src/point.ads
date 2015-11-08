package point is
    -- exception en cas de coordonnées invalides
    invalid_pos : exception;

    type point_t is
        record
            x, y : float := 0.0;
        end record;

    -- Représentation en texte du point
    function to_string(point : point_t) return string;

    -- Deplace le point de delta_x vers la gauche
    -- Garantit: 0 <= coords <= infini
    -- Exception: invalid_pos si coords < 0
    procedure mv_l(point : in out point_t; delta_x : float);
    procedure mv_l(point : in out point_t; delta_x : integer);

    -- Deplace le point de delta_x vers la droite 
    -- Garantit: 0 <= coords <= infini
    -- Exception: invalid_pos si coords < 0
    procedure mv_r(point : in out point_t; delta_x : float);
    procedure mv_r(point : in out point_t; delta_x : integer);
    
    -- Deplace le point de delta_x vers le haut
    -- Garantit: 0 <= coords <= infini
    -- Exception: invalid_pos si coords < 0
    procedure mv_u(point : in out point_t; delta_y : float);
    procedure mv_u(point : in out point_t; delta_y : integer);

    -- Deplace le point de delta_x vers le bas 
    -- Garantit: 0 <= coords <= infini
    -- Exception: invalid_pos si coords < 0
    procedure mv_d(point : in out point_t; delta_y : float);
    procedure mv_d(point : in out point_t; delta_y : integer);

    -- Type décrivant un pointeur de fonction vers une procédure de mv
    type mv_procedure_t is access procedure (point : in out point_t; delta_axis : float);

    mv_l_ptr : constant mv_procedure_t := mv_l'access;
    mv_r_ptr : constant mv_procedure_t := mv_r'access;
    mv_u_ptr : constant mv_procedure_t := mv_u'access;
    mv_d_ptr : constant mv_procedure_t := mv_d'access;

    generic
        mv : mv_procedure_t;
    procedure int_mv (point : in out point_t; delta_axis : integer);
end point;
