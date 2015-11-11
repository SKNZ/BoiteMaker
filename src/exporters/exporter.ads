with box_parts;
use box_parts;

package exporter is
    -- exception erreur export
    unknown_format : exception;

    -- exporte une boite 
    procedure export(box : box_parts_t);
end exporter;
