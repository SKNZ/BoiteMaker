with ada.characters.latin_1;
with box_parts;
use box_parts;
with commandline_args;
use commandline_args;

package svg is
    -- exporte la boite au format svg
    function get_svg(box : box_parts_t) return string;

    private

    lf : constant character := ada.characters.latin_1.lf;
    tab : constant character := ada.characters.latin_1.ht;

    svg_header : constant string :=
"<svg version=""1.1""" & lf & 
"     baseProfile=""full""" & lf & 
--"     width=""300"" height=""200""" & lf & 
"     xmlns=""http://www.w3.org/2000/svg"">" & lf;

    svg_polygon_begin : constant string :=
        tab & "<polygon style=""stroke:red;fill:";

    svg_polygon_end_style : constant string := 
        """ points=""";

    svg_polygon_end : constant string :=
        """/>" & lf;

    svg_footer : constant string := "</svg>";
end svg;
