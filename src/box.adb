with ada.characters.latin_1;
use ada.characters.latin_1;

package body box is
    function initialize_box(t, w, l, h, q, b : integer) return box_t is
        box : box_t := (thickness => t,
                    height => h,
                    width => w,
                    length => l,
                    queue_length => q,
                    inner_height => b);
    begin
        return box;
    end;

    procedure validate_box_measurements(box : box_t) is
    begin
        null;
    end;

    -- renvoie une chaine de texte décrivant l'état de l'objet
    function to_string(box : box_t) return string is
        tab : constant character := ada.characters.latin_1.HT;
        lf : constant character := ada.characters.latin_1.LF;
    begin
        return "Box object: [ t: " & integer'image(box.thickness) & ", " & lf
            & ht & "w: " & integer'image(box.width) & ", " & lf
            & ht & "l: " & integer'image(box.length) & ", " & lf
            & ht & "h: " & integer'image(box.height) & ", " & lf
            & ht & "q: " & integer'image(box.queue_length) & ", " & lf
            & ht & "b: " & integer'image(box.inner_height) & " ]";
    end;
end box;
