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
with logger;
use logger;
with imagemagick;

package body svg is
    function get_svg(box : box_parts_t; input_border_color, input_fill_color, pattern : string) return string is
        base_pos : point_t;

        selected_fill_color : unbounded_string := to_unbounded_string(input_fill_color);
        selected_border_color : unbounded_string := to_unbounded_string(input_border_color);

        function export_polygon(polygon : point_list.node_ptr) return unbounded_string is
            svg_text : unbounded_string := to_unbounded_string(svg_polygon_begin)
                & selected_border_color
                & svg_polygon_fill_style
                & selected_fill_color
                & svg_polygon_end_style;

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
            svg_text : unbounded_string;
        begin
            svg_text := export_panel(halfbox.panel_bottom);
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

        svg_defs : unbounded_string := to_unbounded_string("");
    begin
        debug("Export en svg");

        -- selected_fill_color est init. avec input_fill_color pour valeur
        if length(selected_fill_color) = 0 then
            debug("Pas de couleur de remplissage. Default: " & default_fill_color);
            selected_fill_color := to_unbounded_string(default_fill_color);
        end if;

        -- selected_border_color est init. avec input_border_color pour valeur
        if length(selected_border_color) = 0 then
            debug("Pas de couleur de bordure. Default: " & default_border_color);
            selected_border_color := to_unbounded_string(default_border_color);
        end if;

        if pattern'length /= 0 then
            declare
                base64 : unbounded_string;
                w,h : integer;
            begin
                imagemagick.get_base64(pattern, base64, w, h);

                svg_defs :=
tab & "<defs>" & lf &
tab & "   <pattern id=""polyfill"" patternUnits=""userSpaceOnUse"" width=""" & integer'image(w)  & """ height=""" & integer'image(h) & """>" & lf &
tab & "      <image xlink:href=""" & base64 & """ x=""0"" y=""0"" width="""  & integer'image(w) & """ height=""" & integer'image(h) & """ />" & lf &
tab & "    </pattern>" & lf &
tab & "</defs>" & lf;

                selected_fill_color := to_unbounded_string("url(#polyfill)");
            end;

        end if;

        return
            to_string(svg_header
            & svg_defs
            & export_halfbox(box.lower_halfbox)
            & export_halfbox(box.inner_halfbox)
            & export_halfbox(box.upper_halfbox)
            & svg_footer);
    end;
end svg;
