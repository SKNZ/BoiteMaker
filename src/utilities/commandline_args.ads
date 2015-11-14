with ada.strings.unbounded;
use ada.strings.unbounded;

package commandline_args is
    -- Exception indiquant l'absence d'un argument requis
    argument_missing : exception;

    -- lit les arguments de la ligne de commande
    -- exceptions: argument_missing en l'absence
    --              d'un argument obligatoire
    procedure initialize;

    -- Obtient le paramètre t
    function get_t return integer;

    -- Obtient le paramètre l
    function get_l return integer;

    -- Obtient le paramètre w
    function get_w return integer;

    -- Obtient le paramètre q
    function get_q return integer;

    -- Obtient le paramètre h
    function get_h return integer;

    -- Obtient le paramètre b
    function get_b return integer;

    -- Obtient le paramètre f
    function get_f return string;

    -- Obtient le paramètre fill_color
    function get_fill_color return string;
    
    -- Obtient le paramètre border_color
    function get_border_color return string;

    -- Obtient le paramètre show_help
    function get_show_help return boolean;

private
    -- Constante définissant l'état non initialise
    int_no_value : constant integer := -1;

    -- Les paramètres de l'application
    t, l, w, q, h, b : integer := int_no_value;
    f, border_color, fill_color : unbounded_string := null_unbounded_string;
    show_help : boolean;
end commandline_args;
