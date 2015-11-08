package halfbox_info is
    type halfbox_info_t is
        record
            -- longueur de la demi boite
            length : integer;

            -- largeur de la demi boite
            width : integer;

            -- hauteur de la demi boite
            height : integer;

            -- epaisseur des planches
            thickness : integer;

            -- longueur des queues
            queue_length : integer;
        end record;

    function to_string (halfbox_info : halfbox_info_t) return string;
end halfbox_info;
