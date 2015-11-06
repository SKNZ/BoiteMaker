with point;
use point;
with box_info;
use box_info;

package box_patterns is
    -- Liste de points
    package point_list is new generic_linked_list (point_t);

    type box_patterns_t is
        record
            
        end record;

    -- Dessine la boîte
    function get_patterns(box : box_info_t) return point_list;
end package boite;
