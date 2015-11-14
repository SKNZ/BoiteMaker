with ada.text_io;
use ada.text_io;

package body logger is
    procedure debug(output : string) is
    begin
        if show_debug then
            put_line(output);
        end if;
    end;
    
    procedure set_show_debug(show : boolean) is
    begin
        show_debug := show;
    end;
end logger;
