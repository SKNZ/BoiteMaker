with box_parts;
use box_parts;

package exporter is
    -- exception erreur export
    unknown_format : exception;

    -- format des exporteurs possibles
    type exporter_format_t is (svg, bmp);

    -- exporte une boite 
    procedure export(box : box_parts_t);
end exporter;
