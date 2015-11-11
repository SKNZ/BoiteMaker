with commandline_args;
use commandline_args;

package body exporter is
    -- exporte une boite 
    procedure export(box : box_parts_t) is
        param : string := get_option('e', "svg");
    begin
        null;
        -- case param is
        --     when "svg" =>
        --         svg_exporter.export(box);
        --     when "bmp" =>
        --         bmp_exporter.export(box);
        --     when others =>
        --         raise unknown_format with param;
        -- end case;
    end;
end exporter;
