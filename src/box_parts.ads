with point;
use point;
with box_info;
use box_info;

package box_parts is
    type box_parts_t is
        record
            
        end record;

    -- Génére les différentes parties de la boîte
    function get_parts(box : box_info_t) return box_parts_t;
end package boite;