with point_list;
with halfbox_info;
use halfbox_info;
with petit_poucet;
use petit_poucet;

package halfbox_panel is
    type halfbox_panel_t is
        record
            -- points de la face
            polygon : point_list.node_ptr;
        end record;

    -- Renvoie la face inférieure de la demiboite
    function get_bottom_panel(halfbox_info : halfbox_info_t) return halfbox_panel_t;

    -- Renvoie la face arrière de la demiboite
    function get_back_panel(halfbox_info : halfbox_info_t) return halfbox_panel_t;

    -- Renvoie la face avant de la demiboite
    function get_front_panel(halfbox_info : halfbox_info_t) return halfbox_panel_t;

    -- Renvoie la face droite de la demiboite
    function get_right_panel(halfbox_info : halfbox_info_t) return halfbox_panel_t;

    -- Renvoie la face gauche de la demiboite
    function get_left_panel(halfbox_info : halfbox_info_t) return halfbox_panel_t;

    -- Renvoie une représentation texte de la face
    function to_string(panel : halfbox_panel_t) return string;
    
    private

    -- Ajoute les queues et les encoches
    procedure add_queues(poucet : in out petit_poucet_t; queue_length, queue_width, queue_count : integer; mv_line, mv_queue, mv_socket : mv_poucet_ptr; queue_first : boolean);

    -- Renvoie la face arrière ou avant de la demiboite 
    function get_front_and_back_panel(length, width, thickness, queue_length : integer) return halfbox_panel_t;

    -- Renvoie la face droite ou gauche de la demiboite
    function get_right_and_left_panel(length, width, thickness, queue_length : integer) return halfbox_panel_t;
end halfbox_panel;
