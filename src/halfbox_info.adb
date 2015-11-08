with ada.characters.latin_1;

package body halfbox_info is
    function to_string (halfbox_info : halfbox_info_t) return string is
        tab : constant character := ada.characters.latin_1.HT;
        lf : constant character := ada.characters.latin_1.LF;
    begin
        return "[ " & lf
            & tab & "t: " & integer'image(halfbox_info.thickness) & ", " & lf
            & tab & "w: " & integer'image(halfbox_info.width) & ", " & lf
            & tab & "l: " & integer'image(halfbox_info.length) & ", " & lf
            & tab & "h: " & integer'image(halfbox_info.height) & ", " & lf
            & tab & "q: " & integer'image(halfbox_info.queue_length) & " ]";
    end;
end halfbox_info;
