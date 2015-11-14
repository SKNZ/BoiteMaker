with ada.characters.latin_1;
with logger;
use logger;

package body box_parts is
    function get_parts(box_info : box_info_t) return box_parts_t is
        lower_halfbox : halfbox_t;
        inner_halfbox : halfbox_t;
        upper_halfbox : halfbox_t;
    begin
        debug("Génération de la boîte");

        -- Demi boite inférieure
        lower_halfbox := get_halfbox(
            box_info.width,
            box_info.length,
            -- On gère la parité ici et fait ajoute le "surplus"
            -- sur la boîte du bas
            box_info.height / 2 + box_info.height mod 2,
            box_info.thickness,
            box_info.queue_length);

        -- Demi boite du millieu
        inner_halfbox := get_halfbox(
            box_info.width - 2 * box_info.thickness,
            box_info.length - 2 * box_info.thickness,
            box_info.inner_height,
            box_info.thickness,
            box_info.queue_length);

        -- Demi boite du haut
        upper_halfbox := get_halfbox(
            box_info.width,
            box_info.length,
            box_info.height / 2,
            box_info.thickness,
            box_info.queue_length);

        return (lower_halfbox => lower_halfbox,
            inner_halfbox => inner_halfbox,
            upper_halfbox => upper_halfbox);
    end;

    function to_string(box_parts : box_parts_t) return string is
        tab : constant character := ada.characters.latin_1.HT;
        lf : constant character := ada.characters.latin_1.LF;
    begin
        return "[" & lf
            & tab & "upper_halfbox: " & to_string(box_parts.upper_halfbox) & lf
            & tab & "inner_halfbox: " & to_string(box_parts.inner_halfbox) & lf
            & tab & "lower_halfbox: " & to_string(box_parts.lower_halfbox) & lf
            & "]";
    end;
end box_parts;
