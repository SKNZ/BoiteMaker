with ada.text_io;
use ada.text_io;

package body help is
    procedure show_help is
    begin
        put_line(help_text);
    end;
end help;
