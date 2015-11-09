with point;
use point;
with box_info;
use box_info;
with halfbox;
use halfbox;

package box_parts is
    type box_parts_t is
        record
            -- demi boite inférieur
            lower_halfbox : halfbox_t;            

            -- demi boite supérieure
            upper_halfbox : halfbox_t;

            -- demi boite interne
            inner_halfbox : halfbox_t;
        end record;

    -- Génére les différentes parties de la boîte
    function get_parts(box_info : box_info_t) return box_parts_t;

    -- Réprésentation texte des parties de la boites
    function to_string(box_parts : box_parts_t) return string;
end box_parts;
