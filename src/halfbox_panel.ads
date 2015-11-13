with point_list;
with halfbox_info;
use halfbox_info;

package halfbox_panel is
    type halfbox_panel_t is
        record
            -- points de la face
            polygon : point_list.node_ptr;
        end record;

    -- Renvoie la face inférieure de la demiboite
    function get_bottom_panel(halfbox_info : halfbox_info_t) return halfbox_panel_t;

    -- Renvoie une face de côté de la demiboite (avant, arrière, gauche, droite)
    function get_side_panel(halfbox_info : halfbox_info_t) return halfbox_panel_t;

end halfbox_panel;
