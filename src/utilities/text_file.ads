with ada.strings.unbounded;
use ada.strings.unbounded;
with ada.text_io;
use ada.text_io;

package text_file is
    -- Ecriture une chaîne dans un fichier
    procedure write_string_to_file(file_path, content : string);

    -- Lire le fichier dans la chaîne 
    procedure read_file_to_string(file_path : string; content : out unbounded_string);

    -- Lire le fichier (handle) dans la chaîne
    procedure read_file_to_string(file_handle : in out file_type; content : out unbounded_string);
end text_file;
