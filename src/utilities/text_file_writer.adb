with ada.text_io;
use ada.text_io;
with logger;
use logger;

package body text_file_writer is
    procedure write_string_to_file(file_path, content : string) is
        file : file_type;
    begin
        begin
            debug("Ouverture du fichier " & file_path);
            -- Ouverture du fichier
            open(file, out_file, file_path);
        exception
                -- si le fichier n'existe pas
            when name_error =>
                debug("Fichier inexistant ou erreur. Création");
                -- creation du fichier
                create(file, out_file, file_path);
                debug("Fichier crée");
        end;

        
        -- écriture de la chaîne dans le fichier
        put(file, content);

        -- fermeture du fichier
        close(file);
        debug("Fichier écrit et fermé");
    end;
end text_file_writer;
