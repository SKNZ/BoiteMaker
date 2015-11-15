with ada.characters.latin_1;
with box_parts;
use box_parts;

package svg is
    -- exporte la boite au format svg
    function get_svg(box : box_parts_t; input_border_color, input_fill_color, pattern : string) return string;

    private

    lf : constant character := ada.characters.latin_1.lf;
    tab : constant character := ada.characters.latin_1.ht;

    default_border_color : constant string := "red";
    default_fill_color : constant string := "white";

    svg_header : constant string :=
"<svg version=""1.1""" & lf & 
"     baseProfile=""full""" & lf & 
"     xmlns=""http://www.w3.org/2000/svg""" & lf &
"     xmlns:xlink=""http://www.w3.org/1999/xlink"">" & lf;

    svg_polygon_begin : constant string :=
        tab & "<polygon style=""stroke:";
    
    svg_polygon_fill_style : constant string :=
        ";fill:";

    svg_polygon_end_style : constant string := 
        """ points=""";

    svg_polygon_end : constant string :=
        """/>" & lf;

    svg_footer : constant string := "</svg>";
end svg;
