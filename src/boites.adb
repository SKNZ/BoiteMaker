-- Ada packages
with ada.command_line;
use ada.command_line;
with ada.exceptions;
use ada.exceptions;
with ada.text_io;
use ada.text_io;

-- BoiteMaker packages
with commandline_args;
use commandline_args;
with box_info;
use box_info;
with box_parts;
use box_parts;
with svg;
use svg;
with text_file_writer;
use text_file_writer;
with logger;
use logger;
with help;
use help;

procedure boites is
    box_info : box_info_t;
    box_parts : box_parts_t;
begin
    -- Lecture des arguments de la ligne de commande
    commandline_args.initialize;

    logger.initialize(get_show_debug, get_log_file);
    debug("BoiteMaker started");
    
    if get_show_help then
        put(show_help);
    end if;
    
    -- Construction de l'objet portant les informations de la boîte
    box_info := initialize_box(get_t, get_w, get_l, get_h, get_q, get_b);

    -- Vérification de la cohérence des informations
    validate_box_measurements(box_info);    

    -- Obtention des différens morceaux de la boîte
    box_parts := get_parts(box_info); 

    -- Trop long, log trop verbeux
    -- Potentiellement pertinent
    -- debug(to_string(box_parts));

    -- Export de la boîte générée
    declare
        svg : constant string := get_svg(box_parts, get_border_color, get_fill_color);
    begin
        -- Ecriture du fichier svg
        write_string_to_file(get_f, svg);
    end;
    
    logger.close;
    destroy(box_parts);
exception
    -- Argument manquant
    when e: argument_missing =>
        debug("argument_missing raised: " & exception_message(e));
        put_line("Un argument est manquant: "
            & exception_message(e));

        -- Indication au shell d'un status d'erreur
        set_exit_status(1);
    -- Argument invalide
    when e: invalid_args =>
        debug("argument_missing raised: " & exception_message(e));
        put_line("Vos argument ne respectaient pas la contrainte suivante: "
            & exception_message(e));

        -- Indication au shell d'un status d'erreur
        set_exit_status(2);
end;

-- TU halfbox
--   halfbox : halfbox_t;
--  
--   halfbox := get_halfbox(get_w, get_l, get_h, get_t, get_q);
--   put(to_string(halfbox));
--   new_line;
--
-- TU args
-- Vérifier que les exceptions soient bien levées

-- TU liste
--
--    function int_to_str(x : integer) return string is
--    begin
--        return integer'image(x);
--    end;
--    list : node_ptr := null;
--    node2 : node_ptr := null;
--
--    -- test génériques
--    package int_list is new generic_linked_list(integer);
--    use int_list; 
--    box := initialize_box(get_t, get_w, get_l, get_h, get_q, get_b);
--    put_line(to_string(box));
--
--    list := create(10);
--    put_line(boolean'image(has_next(list)));
--    put(elem(list));
--    new_line;
--
--    node2 := add_after(list, 20);
--    put_line(boolean'image(has_next(list)));
--    put_line(boolean'image(has_next(node2)));
--    put(elem(node2));
--    new_line;
--    put(to_string(list, int_to_str'access));
--    new_line;
--
--    remove_next(list);
--    put_line(boolean'image(has_next(list)));
--    put(elem(list));
--    new_line;
--
--    destroy(list);
--
--    put_line(boolean'image(list = null));
