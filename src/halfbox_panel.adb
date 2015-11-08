with point;
use point;
with point_list;
use point_list;
with ada.characters.latin_1;

package body halfbox_panel is
    -- Ajoute les queues et les encoches
    -- Impl. et doc plus bas
    procedure add_queues(pos : in out point_t; polygon : node_ptr; queue_length, queue_width, queue_count : integer; mv_line, mv_queue, mv_socket : mv_procedure_t);

    function get_bottom_panel(halfbox_info : halfbox_info_t) return halfbox_panel_t is
        -- position courante
        pos : point_t := (others => 0.0);

        -- polygone dessiné par les mouvements du point
        polygon : node_ptr := create(pos);

        -- espace dispo pour les encoches en longeur
        queue_space : integer := halfbox_info.length - 2 * halfbox_info.thickness;
        -- nombre d'encoches à mettre en longeur 
        raw_queue_count : integer := queue_space / halfbox_info.queue_length;
        -- nombre d'encoches à mettre en longeur ramené à l'impair inférieur
        queue_count : integer := raw_queue_count - (raw_queue_count + 1) mod 2;
        -- marge à répartir pour centrer les encoches
        queue_margin : integer := queue_space - queue_count * halfbox_info.queue_length;
    begin
        -- Marge de t à gauche pour les encoches verticales
        -- + la moitié de la marge de centrage des encoches
        mv_r(pos, float(halfbox_info.thickness) + float(queue_margin) / 2.0);
        add_after(polygon, pos);

        -- Ajout des queues et des encoches
        add_queues(pos, polygon, halfbox_info.queue_length, halfbox_info.thickness, queue_count, mv_r_ptr, mv_u_ptr, mv_d_ptr);
         
        -- Marge de t à droite pour les encoches verticales
        -- + l'autre moitié de la marge de centrage des encoches
        mv_r(pos, float(halfbox_info.thickness) + float(queue_margin) / 2.0);
        add_after(polygon, pos);

        return (polygon => polygon);
    end;

    function get_back_panel(halfbox_info : halfbox_info_t) return halfbox_panel_t is
    begin
        return (polygon => create((others => 0.0)));
    end;

    function get_front_panel(halfbox_info : halfbox_info_t) return halfbox_panel_t is
    begin
        return (polygon => create((others => 0.0)));
    end;

    function get_left_panel(halfbox_info : halfbox_info_t) return halfbox_panel_t is
    begin
        return (polygon => create((others => 0.0)));
    end;

    function get_right_panel(halfbox_info : halfbox_info_t) return halfbox_panel_t is
    begin
        return (polygon => create((others => 0.0)));
    end;

    -- Ajoute les queues et les encoches
    -- polygon: le polygon
    -- queue_length : longeur des queues
    -- queue_width : largeur des queues 
    -- queue_count : le nombre de queues
    -- mv_line : fonction de mouvement formant la grande ligne entre une queue et une encoche (et inversement)
    -- mv_queue : fonction de mouvement pour une queue
    -- mv_encoche : fonction de mouvement pour une encoche
    procedure add_queues(pos : in out point_t; polygon : node_ptr; queue_length, queue_width, queue_count : integer; mv_line, mv_queue, mv_socket : mv_procedure_t) is
    begin
        for i in 1 .. queue_count loop
            -- On commence par une encoche (d'où le mod = 1)
            if i mod 2 = 1 then
                mv_socket(pos, float(queue_width));
                add_after(polygon, pos);

                mv_line(pos, float(queue_length));
                add_after(polygon, pos);
            else -- les pairs sont des queues
                mv_queue(pos, float(queue_width));
                add_after(polygon, pos);

                mv_line(pos, float(queue_length));
                add_after(polygon, pos);
            end if;
        end loop;
    end;

    function to_string(panel : halfbox_panel_t) return string is
        tab : constant character := ada.characters.latin_1.HT;
        lf : constant character := ada.characters.latin_1.LF;
    begin
        -- le to_string en pointeur de fonction est celui du point
        return "[" & lf & to_string(panel.polygon, to_string'access) & "]";
    end;
end halfbox_panel;
