with commandline_args;
use commandline_args;
with svg_exporter;
with bmp_exporter;

package body exporter is
    -- exporte une boite 
    procedure export(box : box_parts_t) is
        option_text : string := get_option('e', "svg");
        exporter_format : exporter_format_t;
    begin
        begin
            exporter_format := exporter_format_t'value(option_text);
        exception
            when constraint_error =>
                raise unknown_format with option_text;
        end;

        case exporter_format is
            when svg =>
                svg_exporter.export(box);
            when bmp =>
                bmp_exporter.export(box);
        end case;
    end;
end exporter;
