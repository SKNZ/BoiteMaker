with point_list;
use point_list;
with halfbox_panel;
use halfbox_panel;
with halfbox_info;
use halfbox_info;

package halfbox is
    type halfbox_t is
        record
            -- mesures de la demi-boite
            info : halfbox_info_t;

            -- face inférieure
            panel_bottom : halfbox_panel_t;

            -- face arrière 
            panel_back : halfbox_panel_t;

            -- face avant 
            panel_front : halfbox_panel_t;

            -- face gauche 
            panel_left : halfbox_panel_t;

            -- face droite 
            panel_right : halfbox_panel_t;
        end record;

    -- Obtient une demi-boite avec les mesures données
    function get_halfbox(width, length, height, thickness, queue_length : integer) return halfbox_t;

    -- Obtient une description texte de la demiboite
    function to_string(halfbox : halfbox_t) return string;
end halfbox;
