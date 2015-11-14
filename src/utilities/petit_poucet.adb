with logger;
use logger;

package body petit_poucet is
    -- Instancie un petit poucet
    function get_petit_poucet(start_pos : point_t) return petit_poucet_t is
        start_node : constant node_ptr := create(start_pos);
    begin
        debug("Naissance d'un petit poucet à la position " & to_string(start_pos));

        return (start_pos => start_pos,
                curr_pos => start_pos,
                start_node => start_node,
                curr_node => start_node);
    end;
            
    -- Obtient les points laissés par le petit poucet
    function get_points(poucet : petit_poucet_t) return node_ptr is 
    begin
        return poucet.start_node;
    end;

    -- Cette fonction générique permet d'éviter d'écrire de multiple fois les fonctions mv_* qui sont essentiellement les mêmes, exceptées qu'elles fonctions sur des axes différents (x ou y) et avec des multiplicateurs différents (delta * -1 pour aller à gauche/en haut, delta * 1 sinon)
    -- en passant une fonction de mv (mv_x ou mv_y du package point) et un mult en tant que paramètre de généricité 
    generic
        debug_string : string;
        mv : mv_point_ptr;
        mult : integer;
    procedure mv_poucet(poucet : in out petit_poucet_t; delta_axis : float);

    -- corps de la fonction générique à part car Ada n'autorise pas
    -- déclaration + impl. en même temps quand il s'agit de blocs génériques
    procedure mv_poucet(poucet : in out petit_poucet_t; delta_axis : float) is
    begin
        debug("Le poucet se déplace vers " & debug_string & " de " & float'image(delta_axis));
        mv(poucet.curr_pos, delta_axis * float(mult));

        poucet.curr_node := add_after(poucet.curr_node, poucet.curr_pos);
    end;

    -- Instanciations des fonctions de mouvement avec pour nom internal_*
    -- On ne peut les instancier directement en tant que mv_*
    -- car Ada ne l'autorise pas (message: instanciation cannot provide for body)
    procedure internal_mv_l is new mv_poucet ("l", mv_x_ptr, -1);
    procedure internal_mv_r is new mv_poucet ("r", mv_x_ptr, 1);
    procedure internal_mv_u is new mv_poucet ("u", mv_y_ptr, -1);
    procedure internal_mv_d is new mv_poucet ("d", mv_y_ptr, 1);

    -- Un renommage est par contre une manière valide
    -- de fournir un corps à une fonction déclarée dans le package
    -- (contrairement à une instanciation de fonction générique)
    procedure mv_l(poucet : in out petit_poucet_t; delta_x : float) renames internal_mv_l;
    procedure mv_r(poucet : in out petit_poucet_t; delta_x : float) renames internal_mv_r;
    procedure mv_u(poucet : in out petit_poucet_t; delta_y : float) renames internal_mv_u;
    procedure mv_d(poucet : in out petit_poucet_t; delta_y : float) renames internal_mv_d;
end;
