package box_info is
    -- décrit les paramètres de la boîte
    type box_info_t is
        record
            -- paramètre t
            thickness : integer;

            -- paramètre h
            height : integer;

            -- paramètre w
            width : integer;

            -- paramètre l
            length : integer;

            -- paramètre q
            queue_length : integer;

            -- paramètre b
            -- requiert : b < h - 2t
            inner_height : integer;
        end record;
    
    -- initialise une boîte avec les paramètres donnés
    -- param t : epaisseur des planches
    -- param w : largeur de la boîte
    -- param l : longeur de la boîte
    -- param h : hauteur de la boîte
    -- param q : longeur des queues
    -- param b : hauteur de la boîte interne
    function initialize_box(t, w, l, h, q, b : integer) return box_info_t;

    -- valide les mesures fournies pour la boîte
    procedure validate_box_measurements(box : box_info_t);
    
    -- renvoie une chaine de texte décrivant l'état de l'objet
    function to_string(box : box_info_t) return string;
end box;
