with logger;
use logger;

package body text_file is
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

    procedure read_file_to_string(file_path : string; content : out unbounded_string) is
        file : file_type;
    begin
        content := to_unbounded_string("");

        debug("Ouverture du fichier " & file_path);
        -- Ouverture du fichier
        open(file, in_file, file_path);
       
        while not end_of_file(file) loop
            declare
                line : constant string := get_line(file);
            begin
                append(content, line);
            end;
        end loop;

        -- fermeture du fichier
        close(file);
        debug("Fichier écrit et fermé");
    end;

    procedure read_file_to_string(file_handle : in out file_type; content : out unbounded_string) is
    begin
        reset(file_handle, in_file);

        content := to_unbounded_string("");
       
        while not end_of_file(file_handle) loop
            declare
                line : constant string := get_line(file_handle);
            begin
                append(content, line);
            end;
        end loop;
    end;
end text_file;
