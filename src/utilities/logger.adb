package body logger is
    procedure debug(output : string) is
    begin
        -- affichage sur console
        if show_debug then
            put_line(output);
        end if;

        -- écriture fichier
        if is_open(log_file) then
            put_line(log_file, output);
        end if;
    end;
    
    procedure initialize(console : boolean; file : string) is
    begin
        show_debug := console;

        if file'length /= 0 then
            begin
                -- Ouverture du fichier
                open(log_file, append_file, file);
            exception
                    -- si le fichier n'existe pas
                when name_error =>
                    -- creation du fichier
                    create(log_file, out_file, file);
            end;
        end if;
    end;
    
    procedure close is
    begin
        -- si le fichier est ouvert on ferme
        if is_open(log_file) then
            close(log_file);
        end if;
    end;
end logger;
