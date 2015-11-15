with gnat.os_lib;
use gnat.os_lib;
with gnat.expect;
use gnat.expect;
with text_file;
use text_file;
with ada.directories;
use ada.directories;
with logger;
use logger;

package body imagemagick is
    -- transforme l'image passée en chaine base64 et obtient ses dimensions 
    procedure get_base64(file : string; base64 : out unbounded_string; width, height : out integer) is
        args : argument_list_access;
        result : expect_match;
        proc : process_descriptor;
    begin
        debug("Invocation de imagemagick sur " & file);

        -- commande convert récupérant une image en png base 64 dans le fichier temp 
        args := argument_string_to_list("convert " & file & " inline:png:" & base64_temp_file);

        -- invocation asynchrone du processus convert
        non_blocking_spawn(proc, args(args'first).all, args(args'first + 1 .. args'last), 0);

        begin
            -- expect lève process_died quand convert meurt
            -- passer une string vide à except indique que
            -- l'on veut attendre le timeout
            -- le process mourrant avant le timeout
            -- on obtient bien process_died comme signal
            -- de fin de traitement par convert
            -- on ne peut récupérer directmeent la sortie de
            -- convert car celle-ci overflow le buffer de
            -- expect
            expect(proc, result, "", 1_000);
        exception
            when process_died =>
                null;
        end;

        -- Fermeture du processus et libération des ressources
        close(proc);
        free(args);

        -- Lecture du base64 écrit dans le fichier temporaire
        read_file_to_string(base64_temp_file, base64);
        -- Suppression du fichier temporaire
        delete_file(base64_temp_file);

        debug("Récupération de la largeur de l'image");
        -- Invocation de convert pour récupérer la largeur de l'image
        args := argument_string_to_list("convert " & file  & "  -ping -format %w info:");

        -- invocation asynchrone du processus convert
        non_blocking_spawn(proc, args(args'first).all, args(args'first + 1 .. args'last), 0);

        -- attente que converte renvoie un entier, timeout 1s
        expect(proc, result, "([0-9]+)", 1_000);

        case result is
            -- si convert ne renvoie rien
            when expect_timeout =>
                raise imagemagick_failure with "process timed out";
            -- si convert renvoie
            when 1 =>
                -- on récupère le match de la regex sous la forme d'un entier
                width := integer'value(expect_out_match(proc));
            when others => null;
        end case;

        -- Libération des ressources
        close(proc);
        free(args);

        debug("Récupération de la hauteur de l'image");

        -- Commande convert récupérant la hauteur de l'image
        args := argument_string_to_list("convert " & file  & "  -ping -format %h info:");

        -- invocation asynchrone du processus convert
        non_blocking_spawn(proc, args(args'first).all, args(args'first + 1 .. args'last), 0);

        -- attente que converte renvoie un entier, timeout 1s
        expect(proc, result, "([0-9]+)", 1_000);

        case result is
            -- si convert ne renvoie rien
            when expect_timeout =>
                raise imagemagick_failure with "process timed out";
            -- si convert renvoie
            when 1 =>
                -- on récupère le match de la regex
                height := integer'value(expect_out_match(proc));
            when others => null;
        end case;

        -- libération des ressources
        close(proc);
        free(args);

        debug("Fin de imagemagick");
    end;
end imagemagick;
