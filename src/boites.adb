-- Ada packages
with ada.command_line;
use ada.command_line;
with ada.exceptions;
use ada.exceptions;
with ada.integer_text_io;
use ada.integer_text_io;
with ada.text_io;
use ada.text_io;

-- BoiteMaker packages
with generic_linked_list;
with commandline_args;
use commandline_args;
with box_info;
use box_info;
with halfbox;
use halfbox;

procedure boites is
    box : box_info_t;
    -- test génériques
    package int_list is new generic_linked_list(integer);
    use int_list; 

    list : node_ptr := null;
    node2 : node_ptr := null;

    function int_to_str(x : integer) return string is
    begin
        return integer'image(x);
    end;

    halfbox : halfbox_t;
begin
    -- Lecture des arguments de la ligne de commande
    begin
        commandline_args.initialize;
    exception
        -- Argument manquant
        when e: argument_missing =>
            put_line("Un argument est manquant: "
                & exception_message(e));

            -- Indication au shell d'un status d'erreur
            set_exit_status(1);
            return;
    end;

    halfbox := get_halfbox(get_w, get_l, get_h, get_t, get_q);
    put(to_string(halfbox));
    new_line;

end;

-- TU args
-- Vérifier que les exceptions soient bien levées

-- TU liste
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
