with box_parts;
use box_parts;

package exporter is
    -- exception erreur export
    unknown_format : exception;

    -- format des exporteurs possibles
    type exporter_format_t is (svg, bmp);

    -- destination possible pour les exporteurs
    type exporter_dest_t is (console, file);

    -- exporte une boite 
    procedure export(box : box_parts_t);
end exporter;
