with box_parts;
use box_parts;

package svg_exporter is
    -- exporte la boite au format svg
    procedure export(box : box_parts_t);

    private

    svg_header : constant string :=
"<svg version=""1.1""" &
"     baseProfile=""full""" &
"     width=""300"" height=""200""" &
"     xmlns=""http://www.w3.org/2000/svg"">"; 

    svg_polygon_begin : constant string :=
        "<polygon style=""stroke:red"" points=""";

    svg_polygon_end : constant string :=
        """/>";

    svg_footer : constant string := "</svg>";
end svg_exporter;
