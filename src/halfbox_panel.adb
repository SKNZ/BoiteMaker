with ada.characters.latin_1;
with point_list;
use point_list;
with point;
use point;
with logger;
use logger;

package body halfbox_panel is
    function get_bottom_panel(halfbox_info : halfbox_info_t) return halfbox_panel_t is
        -- Petit poucet pour tracer la face
        poucet : petit_poucet_t := get_petit_poucet((0.0, 0.0));

        -- espace dispo pour les encoches en longueur
        l_queue_space : constant integer := halfbox_info.length - 2 * halfbox_info.thickness;
        
        -- nombre d'encoches à mettre en longueur 
        l_raw_queue_count : constant integer := l_queue_space / halfbox_info.queue_length;

        -- nombre d'encoches à mettre en longueur ramené à l'impair inférieur
        l_queue_count : constant integer := l_raw_queue_count - (l_raw_queue_count + 1) mod 2;

        -- marge à répartir pour centrer les encoches en longueur
        l_queue_margin : constant integer := l_queue_space - l_queue_count * halfbox_info.queue_length;

        -- espace dispo pour les encoches en largeur
        w_queue_space : constant integer := halfbox_info.width - 2 * halfbox_info.thickness;
        
        -- nombre d'encoches à mettre en largeur 
        w_raw_queue_count : constant integer := w_queue_space / halfbox_info.queue_length;

        -- nombre d'encoches à mettre en largeur ramené à l'impair inférieur
        w_queue_count : integer := w_raw_queue_count - (w_raw_queue_count + 1) mod 2;

        -- marge à répartir pour centrer les encoches en largeur
        w_queue_margin : integer := w_queue_space - w_queue_count * halfbox_info.queue_length;
    begin
        debug("Génération de la face du fond");
        debug("Marge calculée en longueur: " & integer'image(l_queue_margin));
        debug("Marge calculée en largeur: " & integer'image(w_queue_margin));
        
        -- Si possible, réduction du nombre d'encoches à mettre en largeur
        -- pour éviter des "cassures" physiques du coin d'une face
        if halfbox_info.width = 2 * halfbox_info.thickness + w_queue_count * halfbox_info.queue_length and w_queue_count >= 3 then
            debug("Réduction du nombre d'encoches en largeur de 2");
            w_queue_count := w_queue_count - 2;
            -- L'espace manquant est compensé dans la marge
            w_queue_margin := w_queue_margin + 2 * halfbox_info.queue_length;
        end if;

        -- Bord haut de la face
        
        -- Marge de t à gauche pour les encoches
        -- + la moitié de la marge de centrage des encoches en longueur
        mv_r(poucet, float(halfbox_info.thickness) + float(l_queue_margin) / 2.0);

        -- Ajout des queues et des encoches en longueur
        add_queues(poucet, halfbox_info.queue_length, halfbox_info.thickness, l_queue_count, mv_r_ptr, mv_u_ptr, mv_d_ptr, false);

        -- Marge de t à droite pour les encoches
        -- + l'autre moitié de la marge de centrage des encoches en longueur
        mv_r(poucet, float(halfbox_info.thickness) + float(l_queue_margin) / 2.0);

        -- Bord droit de la face
        
        -- Marge de t en haut pour les encoches 
        -- + la moitié de la marge de centrage des encoches en largeur 
        mv_d(poucet, float(halfbox_info.thickness) + float(w_queue_margin) / 2.0);

        -- Ajout des queues et des encoches en largeur 
        add_queues(poucet, halfbox_info.queue_length, halfbox_info.thickness, w_queue_count, mv_d_ptr, mv_r_ptr, mv_l_ptr, false);

        -- Marge de t en bas pour les encoches
        -- + l'autre moitié de la marge de centrage des encoches en largeur 
        mv_d(poucet, float(halfbox_info.thickness) + float(w_queue_margin) / 2.0);

        -- Bord bas de la face
        
        -- Marge de t à droite pour les encoches
        -- + la moitié de la marge de centrage des encoches en longueur
        mv_l(poucet, float(halfbox_info.thickness) + float(l_queue_margin) / 2.0);

        -- Ajout des queues et des encoches en longueur
        add_queues(poucet, halfbox_info.queue_length, halfbox_info.thickness, l_queue_count, mv_l_ptr, mv_d_ptr, mv_u_ptr, false);

        -- Marge de t à gauche pour les encoches
        -- + l'autre moitié de la marge de centrage des encoches en longueur
        mv_l(poucet, float(halfbox_info.thickness) + float(l_queue_margin) / 2.0);

        -- Bord gauche de la face
        
        -- Marge de t en bas pour les encoches 
        -- + la moitié de la marge de centrage des encoches en largeur 
        mv_u(poucet, float(halfbox_info.thickness) + float(w_queue_margin) / 2.0);

        -- Ajout des queues et des encoches en largeur 
        add_queues(poucet, halfbox_info.queue_length, halfbox_info.thickness, w_queue_count, mv_u_ptr, mv_l_ptr, mv_r_ptr, false);

        -- Marge de t en haut pour les encoches
        -- + l'autre moitié de la marge de centrage des encoches en largeur 
        mv_u(poucet, float(halfbox_info.thickness) + float(w_queue_margin) / 2.0);

        -- On doit être revenu pos. 0,0
        
        return (polygon => get_points(poucet));
    end;
    
    function get_back_panel(halfbox_info : halfbox_info_t) return halfbox_panel_t is
    begin
        debug("Génération de la face de derrière");
        return get_front_and_back_panel(halfbox_info.length, halfbox_info.height, halfbox_info.thickness, halfbox_info.queue_length);
    end;

    function get_front_panel(halfbox_info : halfbox_info_t) return halfbox_panel_t is
    begin
        debug("Génération de la face de devant");
        return get_front_and_back_panel(halfbox_info.length, halfbox_info.height, halfbox_info.thickness, halfbox_info.queue_length);
    end;

    function get_right_panel(halfbox_info : halfbox_info_t) return halfbox_panel_t is
    begin
        debug("Génération de la face de droite");
        return get_right_and_left_panel(halfbox_info.width, halfbox_info.height, halfbox_info.thickness, halfbox_info.queue_length);
    end;

    function get_left_panel(halfbox_info : halfbox_info_t) return halfbox_panel_t is
    begin
        debug("Génération de la face de gauche");
        return get_right_and_left_panel(halfbox_info.width, halfbox_info.height, halfbox_info.thickness, halfbox_info.queue_length);
    end;


    function get_front_and_back_panel(length, width, thickness, queue_length : integer) return halfbox_panel_t is
        -- poucet de tracer de la face 
        -- commence directement à 0;t
        poucet : petit_poucet_t := get_petit_poucet((0.0, float(thickness)));

        -- espace dispo pour les encoches en longueur
        l_queue_space : constant integer := length - 2 * thickness;
        
        -- nombre d'encoches à mettre en longueur 
        l_raw_queue_count : constant integer := l_queue_space / queue_length;

        -- nombre d'encoches à mettre en longueur ramené à l'impair inférieur
        l_queue_count : constant integer := l_raw_queue_count - (l_raw_queue_count + 1) mod 2;

        -- marge à répartir pour centrer les encoches en longueur
        l_queue_margin : constant integer := l_queue_space - l_queue_count * queue_length;

        -- espace dispo pour les encoches en largeur
        w_queue_space : constant integer := width - 2 * thickness;
        
        -- nombre d'encoches à mettre en largeur 
        w_raw_queue_count : constant integer := w_queue_space / queue_length;

        -- nombre d'encoches à mettre en largeur ramené à l'impair inférieur
        w_queue_count : constant integer := w_raw_queue_count - (w_raw_queue_count + 1) mod 2;

        -- marge à répartir pour centrer les encoches en largeur
        w_queue_margin : constant integer := w_queue_space - w_queue_count * queue_length;
    begin
        debug("Marge calculée en longueur: " & integer'image(l_queue_margin));
        debug("Marge calculée en largeur: " & integer'image(w_queue_margin));

        -- Bord haut de la face
        
        -- Marge de t à gauche pour les encoches
        -- + la moitié de la marge de centrage des encoches en longueur
        mv_r(poucet, float(thickness) + float(l_queue_margin) / 2.0);

        -- Ajout des queues et des encoches en longueur
        add_queues(poucet, queue_length, thickness, l_queue_count, mv_r_ptr, mv_u_ptr, mv_d_ptr, true);

        -- Marge de t à droite pour les encoches
        -- + l'autre moitié de la marge de centrage des encoches en longueur
        mv_r(poucet, float(thickness) + float(l_queue_margin) / 2.0);
        
        -- Bord droit de la face
        
        -- Marge de t en haut pour les encoches 
        -- + l'autre moitié de la marge de centrage des encoches en largeur 
        mv_d(poucet, float(thickness) + float(w_queue_margin) / 2.0);

        -- Ajout des queues et des encoches en largeur 
        add_queues(poucet, queue_length, thickness, w_queue_count, mv_d_ptr, mv_r_ptr, mv_l_ptr, false);

        -- Marge de t en bas pour les encoches
        -- + l'autre moitié de la marge de centrage des encoches en largeur 
        mv_d(poucet, float(thickness) + float(w_queue_margin) / 2.0);

        -- Bord bas de la face
        -- Le bord bas est un bord droit ("lisse")
        
        mv_l(poucet, float(length));

        -- Bord gauche de la face
        
        -- Marge de t en bas pour les encoches 
        -- + la moitié de la marge de centrage des encoches en largeur 
        mv_u(poucet, float(thickness) + float(w_queue_margin) / 2.0);

        -- Ajout des queues et des encoches en largeur 
        add_queues(poucet, queue_length, thickness, w_queue_count, mv_u_ptr, mv_l_ptr, mv_r_ptr, false);

        -- Marge de t en haut pour les encoches
        -- + la moitié de la marge de centrage des encoches en largeur 
        mv_u(poucet, float(thickness) + float(w_queue_margin) / 2.0);

        -- On doit être revenu pos. 0,t

        return (polygon => get_points(poucet));
    end;


    function get_right_and_left_panel(length, width, thickness, queue_length : integer) return halfbox_panel_t is
        -- poucet de tracer de la face 
        -- commence directement à t;t
        poucet : petit_poucet_t := get_petit_poucet((float(thickness), float(thickness)));

        -- espace dispo pour les encoches en longueur
        l_queue_space : constant integer := length - 2 * thickness;
        
        -- nombre d'encoches à mettre en longueur 
        l_raw_queue_count : constant integer := l_queue_space / queue_length;

        -- nombre d'encoches à mettre en longueur ramené à l'impair inférieur
        l_queue_count : integer := l_raw_queue_count - (l_raw_queue_count + 1) mod 2;

        -- marge à répartir pour centrer les encoches en longueur
        l_queue_margin : integer := l_queue_space - l_queue_count * queue_length;

        -- espace dispo pour les encoches en largeur
        w_queue_space : constant integer := width - 2 * thickness;
        
        -- nombre d'encoches à mettre en largeur 
        w_raw_queue_count : constant integer := w_queue_space / queue_length;

        -- nombre d'encoches à mettre en largeur ramené à l'impair inférieur
        w_queue_count : constant integer := w_raw_queue_count - (w_raw_queue_count + 1) mod 2;

        -- marge à répartir pour centrer les encoches en largeur
        w_queue_margin : constant integer := w_queue_space - w_queue_count * queue_length;
    begin
        debug("Marge calculée en longueur: " & integer'image(l_queue_margin));
        debug("Marge calculée en largeur: " & integer'image(w_queue_margin));

        -- Si possible, réduction du nombre d'encoches à mettre sur la face du haut
        -- pour éviter des "cassures" physiques du coin de la face inférieure
        if length = 2 * thickness + l_queue_count * queue_length and l_queue_count >= 3 then
            l_queue_count := l_queue_count - 2;
            -- L'espace manquant est compensé dans la marge
            l_queue_margin := l_queue_margin + 2 * queue_length;
        end if;

        -- Bord haut de la face
        
        -- Marge de t à gauche pour les encoches
        -- + la moitié de la marge de centrage des encoches en longueur
        mv_r(poucet, float(thickness) + float(l_queue_margin) / 2.0);

        -- Ajout des queues et des encoches en longueur
        add_queues(poucet, queue_length, thickness, l_queue_count, mv_r_ptr, mv_u_ptr, mv_d_ptr, true);

        -- Marge de t à droite pour les encoches
        -- + l'autre moitié de la marge de centrage des encoches en longueur
        mv_r(poucet, float(thickness) + float(l_queue_margin) / 2.0);
        
        -- Bord droit de la face
        
        -- Marge de t en haut pour les encoches 
        -- + l'autre moitié de la marge de centrage des encoches en largeur 
        mv_d(poucet, float(thickness) + float(w_queue_margin) / 2.0);

        -- Ajout des queues et des encoches en largeur 
        add_queues(poucet, queue_length, thickness, w_queue_count, mv_d_ptr, mv_r_ptr, mv_l_ptr, true);

        -- Marge de t en bas pour les encoches
        -- + l'autre moitié de la marge de centrage des encoches en largeur 
        mv_d(poucet, float(thickness) + float(w_queue_margin) / 2.0);

        -- Bord bas de la face
        -- Le bord bas est un bord droit ("lisse")
        mv_l(poucet, float(length));

        -- Bord gauche de la face
        
        -- Marge de t en bas pour les encoches 
        -- + la moitié de la marge de centrage des encoches en largeur 
        mv_u(poucet, float(thickness) + float(w_queue_margin) / 2.0);

        -- Ajout des queues et des encoches en largeur 
        add_queues(poucet, queue_length, thickness, w_queue_count, mv_u_ptr, mv_l_ptr, mv_r_ptr, true);

        -- Marge de t en haut pour les encoches
        -- + la moitié de la marge de centrage des encoches en largeur 
        mv_u(poucet, float(thickness) + float(w_queue_margin) / 2.0);

        -- On doit être revenu pos. t,t

        return (polygon => get_points(poucet));
    end;


    -- Ajoute les queues et les encoches
    -- poucet : le petit poucet !
    -- queue_length : longueur des queues
    -- queue_width : largeur des queues 
    -- queue_count : le nombre de queues
    -- mv_line : fonction de mouvement formant la grande ligne entre une queue et une encoche (et inversement)
    -- mv_queue : fonction de mouvement pour une queue
    -- mv_encoche : fonction de mouvement pour une encoche
    -- queue_first : si on commence par une queue
    procedure add_queues(poucet : in out petit_poucet_t; queue_length, queue_width, queue_count : integer; mv_line, mv_queue, mv_socket : mv_poucet_ptr; queue_first : boolean) is
    begin
        debug("Ajout des queues et des encoches.");
        debug("Commence queue: " & boolean'image(queue_first) & ". Nombre:" & integer'image(queue_count));

        for i in 1 .. queue_count loop
            -- permet de commencer par une encoche ou une queue
            if i mod 2 = boolean'pos(queue_first) mod 2 then
                mv_queue(poucet, float(queue_width));

                mv_line(poucet, float(queue_length));
            else -- les pairs sont des queues
                mv_socket(poucet, float(queue_width));

                mv_line(poucet, float(queue_length));
            end if;
        end loop;

        if queue_first then
            mv_socket(poucet, float(queue_width));
        else
            mv_queue(poucet, float(queue_width));
        end if;
    end;

    function to_string(panel : halfbox_panel_t) return string is
        lf : constant character := ada.characters.latin_1.LF;
    begin
        -- le to_string en pointeur de fonction est celui du point
        return "[" & lf & to_string(panel.polygon, to_string'access) & "]";
    end;
end halfbox_panel;
