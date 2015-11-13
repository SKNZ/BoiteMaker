with ada.text_io;
use ada.text_io;

package body text_file_writer is
    procedure write_string_to_file(file_path, content : string) is
        file : file_type;
    begin
        begin
            -- Ouverture du fichier
            open(file, out_file, file_path);
        exception
                -- si le fichier n'existe pas
            when name_error =>
                -- creation du fichier
                create(file, out_file, file_path);
        end;

        -- écriture de la chaîne dans le fichier
        put(file, content);

        -- fermeture du fichier
        close(file);
    end;
end text_file_writer;
