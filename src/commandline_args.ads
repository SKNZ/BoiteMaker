with ada.strings.unbounded;
use ada.strings.unbounded;

package commandline_args is
    -- lit les arguments de la ligne de commande
    procedure initialize;

private
    t, l, w, q, h, b : integer;
    f : unbounded_string;
end commandline_args;
