with ada.characters.latin_1;
use ada.characters.latin_1;

package body box_info is
    function initialize_box(t, w, l, h, q, b : integer) return box_info_t is
        box : box_info_t := (thickness => t,
                                height => h,
                                width => w,
                                length => l,
                                queue_length => q,
                                inner_height => b);
    begin
        return box;
    end;

    -- requiert :
    -- t, l, w, q, h, b, q > 0
    -- l >= w
    -- l-2t, w-2t > 0
    -- b < h-2t
    -- q <= w-4t (au moins une encoche; également pour le inner_panel, d'où le 4)
    procedure validate_box_measurements(box : box_info_t) is
    begin
        if not (box.thickness > 0) then
            raise invalid_args with "t > 0";
        end if;

        if not (box.length > 0) then
            raise invalid_args with "l > 0";
        end if;

        if not (box.width > 0) then
            raise invalid_args with "w > 0";
        end if;

        if not (box.queue_length > 0) then
            raise invalid_args with "q > 0";
        end if;

        if not (box.height > 0) then
            raise invalid_args with "h > 0";
        end if;

        if not (box.inner_height > 0) then
            raise invalid_args with "b > 0";
        end if;

        if not (box.queue_length > 0) then
            raise invalid_args with "q > 0";
        end if;

        if not (box.length >= box.width) then
            raise invalid_args with "l >= w";
        end if;

        if not (box.length - 2 * box.thickness > 0) then
            raise invalid_args with "l - 2 * t > 0";
        end if;

        if not (box.width - 2 * box.thickness > 0) then
            raise invalid_args with "w - 2 * t > 0";
        end if;

        if not (box.inner_height < box.height - 2 * box.thickness) then
            raise invalid_args with "b < h - 2 * t";
        end if;

        if not (box.queue_length <= box.width - 4 * box.thickness) then
            raise invalid_args with "q <= w - 4 * t";
        end if;
    end;

    -- renvoie une chaine de texte décrivant l'état de l'objet
    function to_string(box : box_info_t) return string is
        tab : constant character := ada.characters.latin_1.HT;
        lf : constant character := ada.characters.latin_1.LF;
    begin
        return "[ " 
            & ht & "t: " & integer'image(box.thickness) & ", " & lf
            & ht & "w: " & integer'image(box.width) & ", " & lf
            & ht & "l: " & integer'image(box.length) & ", " & lf
            & ht & "h: " & integer'image(box.height) & ", " & lf
            & ht & "q: " & integer'image(box.queue_length) & ", " & lf
            & ht & "b: " & integer'image(box.inner_height) & " ]";
    end;
end box_info;
