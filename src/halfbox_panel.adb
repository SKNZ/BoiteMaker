with point;
use point;
with point_list;
use point_list;
with ada.characters.latin_1;

package body halfbox_panel is
    -- Ajoute les queues et les encoches
    -- Impl. et doc plus bas
    procedure add_queues(pos : in out point_t; last_point : in out node_ptr; queue_length, queue_width, queue_count : integer; mv_line, mv_queue, mv_socket : mv_procedure_t);

    function get_bottom_panel(halfbox_info : halfbox_info_t) return halfbox_panel_t is
        -- position courante
        pos : point_t := (others => 0.0);

        -- polygone dessiné par les mouvements du point
        polygon : node_ptr := create(pos);

        -- dernier point ajouté au polygone
        last_point : node_ptr := polygon;

        -- espace dispo pour les encoches en longueur
        l_queue_space : integer := halfbox_info.length - 2 * halfbox_info.thickness;
        
        -- nombre d'encoches à mettre en longueur 
        l_raw_queue_count : integer := l_queue_space / halfbox_info.queue_length;

        -- nombre d'encoches à mettre en longueur ramené à l'impair inférieur
        l_queue_count : integer := l_raw_queue_count - (l_raw_queue_count + 1) mod 2;

        -- marge à répartir pour centrer les encoches en longueur
        l_queue_margin : integer := l_queue_space - l_queue_count * halfbox_info.queue_length;

        -- espace dispo pour les encoches en largeur
        w_queue_space : integer := halfbox_info.width - 2 * halfbox_info.thickness;
        
        -- nombre d'encoches à mettre en largeur 
        w_raw_queue_count : integer := w_queue_space / halfbox_info.queue_length;

        -- nombre d'encoches à mettre en largeur ramené à l'impair inférieur
        w_queue_count : integer := w_raw_queue_count - (w_raw_queue_count + 1) mod 2;

        -- marge à répartir pour centrer les encoches en largeur
        w_queue_margin : integer := w_queue_space - w_queue_count * halfbox_info.queue_length;
    begin
        -- Bord haut de la face
        
        -- Marge de t à gauche pour les encoches
        -- + la moitié de la marge de centrage des encoches en longueur
        mv_r(pos, float(halfbox_info.thickness) + float(l_queue_margin) / 2.0);
        last_point := add_after(last_point, pos);

        -- Ajout des queues et des encoches en longueur
        add_queues(pos, last_point, halfbox_info.queue_length, halfbox_info.thickness, l_queue_count, mv_r_ptr, mv_u_ptr, mv_d_ptr);

        -- Marge de t à droite pour les encoches
        -- + l'autre moitié de la marge de centrage des encoches en longueur
        mv_r(pos, float(halfbox_info.thickness) + float(l_queue_margin) / 2.0);
        last_point := add_after(last_point, pos);

        -- Bord droit de la face
        
        -- Marge de t en haut pour les encoches 
        -- + la moitié de la marge de centrage des encoches en largeur 
        mv_d(pos, float(halfbox_info.thickness) + float(w_queue_margin) / 2.0);
        last_point := add_after(last_point, pos);

        -- Ajout des queues et des encoches en largeur 
        add_queues(pos, last_point, halfbox_info.queue_length, halfbox_info.thickness, w_queue_count, mv_d_ptr, mv_r_ptr, mv_l_ptr);

        -- Marge de t en bas pour les encoches
        -- + l'autre moitié de la marge de centrage des encoches en largeur 
        mv_d(pos, float(halfbox_info.thickness) + float(w_queue_margin) / 2.0);
        last_point := add_after(last_point, pos);

        -- Bord bas de la face
        
        -- Marge de t à droite pour les encoches
        -- + la moitié de la marge de centrage des encoches en longueur
        mv_l(pos, float(halfbox_info.thickness) + float(l_queue_margin) / 2.0);
        last_point := add_after(last_point, pos);

        -- Ajout des queues et des encoches en longueur
        add_queues(pos, last_point, halfbox_info.queue_length, halfbox_info.thickness, l_queue_count, mv_l_ptr, mv_d_ptr, mv_u_ptr);

        -- Marge de t à gauche pour les encoches
        -- + l'autre moitié de la marge de centrage des encoches en longueur
        mv_l(pos, float(halfbox_info.thickness) + float(l_queue_margin) / 2.0);
        last_point := add_after(last_point, pos);

        -- Bord gauche de la face
        
        -- Marge de t en bas pour les encoches 
        -- + la moitié de la marge de centrage des encoches en largeur 
        mv_u(pos, float(halfbox_info.thickness) + float(w_queue_margin) / 2.0);
        last_point := add_after(last_point, pos);

        -- Ajout des queues et des encoches en largeur 
        add_queues(pos, last_point, halfbox_info.queue_length, halfbox_info.thickness, w_queue_count, mv_u_ptr, mv_l_ptr, mv_r_ptr);

        -- Marge de t en haut pour les encoches
        -- + l'autre moitié de la marge de centrage des encoches en largeur 
        mv_u(pos, float(halfbox_info.thickness) + float(w_queue_margin) / 2.0);
        last_point := add_after(last_point, pos);

        -- On doit être revenu pos. 0,0

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
    -- pos : la position courante
    -- last_point: le dernier point du polygone
    -- queue_length : longueur des queues
    -- queue_width : largeur des queues 
    -- l_queue_count : le nombre de queues
    -- mv_line : fonction de mouvement formant la grande ligne entre une queue et une encoche (et inversement)
    -- mv_queue : fonction de mouvement pour une queue
    -- mv_encoche : fonction de mouvement pour une encoche
    procedure add_queues(pos : in out point_t; last_point : in out node_ptr; queue_length, queue_width, queue_count : integer; mv_line, mv_queue, mv_socket : mv_procedure_t) is
    begin
        for i in 1 .. queue_count loop
            -- On commence par une encoche (d'où le mod = 1)
            if i mod 2 = 1 then
                mv_socket(pos, float(queue_width));
                last_point := add_after(last_point, pos);

                mv_line(pos, float(queue_length));
                last_point := add_after(last_point, pos);
            else -- les pairs sont des queues
                mv_queue(pos, float(queue_width));
                last_point := add_after(last_point, pos);

                mv_line(pos, float(queue_length));
                last_point := add_after(last_point, pos);
            end if;
        end loop;

        -- On revient en position initiale 
        mv_queue(pos, float(queue_width));
    end;

    function to_string(panel : halfbox_panel_t) return string is
        tab : constant character := ada.characters.latin_1.HT;
        lf : constant character := ada.characters.latin_1.LF;
    begin
        -- le to_string en pointeur de fonction est celui du point
        return "[" & lf & to_string(panel.polygon, to_string'access) & "]";
    end;
end halfbox_panel;
