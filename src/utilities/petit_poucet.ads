with point_list;
use point_list;
with point;
use point;

package petit_poucet is
    -- Un petit poucet est un objet possèdant un jeu de coordonées
    -- et qui enregistre chacun des mouvements qu'il réalise
    -- permettant ensuite de récupérer l'historique de ses mouvements
    type petit_poucet_t is
        record
            -- historique des points du petit poucet
            start_node : node_ptr;

            -- historique des points du petit poucet
            curr_node : node_ptr;

            -- position de départ du petit poucet
            start_pos : point_t;

            -- position courrante du petit poucet
            curr_pos : point_t;
        end record;

    -- Instancie un petit poucet
    function get_petit_poucet(start_pos : point_t) return petit_poucet_t;
            
    -- Obtient les points laissés par le petit poucet
    function get_points(poucet : petit_poucet_t) return node_ptr;

    -- Deplace le petit poucet de delta_x vers la gauche
    -- Garantit: 0 <= coords <= infini
    -- Exception: invalid_pos si coords < 0
    procedure mv_l(poucet : in out petit_poucet_t; delta_x : float);
    -- procedure mv_l(poucet : in out petit_poucet_t; delta_x : integer);

    -- Deplace le petit poucet de delta_x vers la droite 
    -- Garantit: 0 <= coords <= infini
    -- Exception: invalid_pos si coords < 0
    procedure mv_r(poucet : in out petit_poucet_t; delta_x : float);
    -- procedure mv_r(poucet : in out petit_poucet_t; delta_x : integer);
    
    -- Deplace le petit poucet de delta_y vers le haut
    -- Garantit: 0 <= coords <= infini
    -- Exception: invalid_pos si coords < 0
    procedure mv_u(poucet : in out petit_poucet_t; delta_y : float);
    -- procedure mv_u(poucet : in out petit_poucet_t; delta_y : integer);

    -- Deplace le petit poucet de delta_y vers le bas 
    -- Garantit: 0 <= coords <= infini
    -- Exception: invalid_pos si coords < 0
    procedure mv_d(poucet : in out petit_poucet_t; delta_y : float);
    -- procedure mv_d(poucet : in out petit_poucet_t; delta_y : integer);

    -- Type décrivant un pointeur de fonction
    -- vers une procédure de mv de poucet
    type mv_poucet_ptr is access procedure (poucet : in out petit_poucet_t; delta_axis : float);

    -- Constantes de pointeurs vers les mv_* du poucet
    mv_l_ptr : constant mv_poucet_ptr := mv_l'access;
    mv_r_ptr : constant mv_poucet_ptr := mv_r'access;
    mv_u_ptr : constant mv_poucet_ptr := mv_u'access;
    mv_d_ptr : constant mv_poucet_ptr := mv_d'access;
end petit_poucet;
