with ada.text_io;
use ada.text_io;

package logger is
    -- Log le message passé en débug
    procedure debug(output : string);

    -- Initialise le loggeur
    procedure initialize(console : boolean; file : string);

    -- Ferme le loggeur
    procedure close;

    private
    -- Afficher le debug sur la console
    show_debug : boolean := false;

    -- Fichier de log
    log_file : file_type;
end logger;
