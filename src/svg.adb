with ada.strings.unbounded;
use ada.strings.unbounded;
with point_list;
use point_list;
with point;
use point;
with halfbox_panel;
use halfbox_panel;
with halfbox;
use halfbox;

package body svg is
    function get_svg(box : box_parts_t) return string is
        base_pos : point_t;

        function export_polygon(polygon : point_list.node_ptr) return unbounded_string is
            svg_text : unbounded_string := to_unbounded_string(svg_polygon_begin);
            curr_point : point_list.node_ptr := polygon;
            curr_pos : point_t;
        begin
            while has_next(curr_point) loop
                curr_pos := elem(curr_point);

                append(svg_text,
                    float'image(base_pos.x + curr_pos.x)
                    & ','
                    & float'image(base_pos.y + curr_pos.y)
                    & ' ');

                curr_point := move_next(curr_point);
            end loop;

            return svg_text & svg_polygon_end; 
        end;

        function export_panel(panel : halfbox_panel_t) return unbounded_string is
        begin
            return export_polygon(panel.polygon);
        end;

        function export_halfbox (halfbox : halfbox_t) return string is
            svg_text : unbounded_string := to_unbounded_string("");
        begin
            append(svg_text, export_panel(halfbox.panel_bottom));
            base_pos := (base_pos.x + float(halfbox.info.length) + 5.0, base_pos.y);

            append(svg_text, export_panel(halfbox.panel_front));
            base_pos := (base_pos.x + float(halfbox.info.length) + 5.0, base_pos.y);

            append(svg_text, export_panel(halfbox.panel_back));
            base_pos := (base_pos.x + float(halfbox.info.length) + 5.0, base_pos.y);

            append(svg_text, export_panel(halfbox.panel_left));
            base_pos := (base_pos.x + float(halfbox.info.width) + 10.0, base_pos.y);
            
            append(svg_text, export_panel(halfbox.panel_right));
            base_pos := (0.0, base_pos.y + float(integer'max(halfbox.info.width, halfbox.info.height)) + 10.0);

            return to_string(svg_text);
        end;
    begin
        return
            svg_header
            & export_halfbox(box.lower_halfbox)
            & export_halfbox(box.inner_halfbox)
            & export_halfbox(box.upper_halfbox)
            & svg_footer;
    end;
end svg;
