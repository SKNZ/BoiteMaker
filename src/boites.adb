with ada.command_line;
use ada.command_line;
with ada.exceptions;
use ada.exceptions;
with ada.integer_text_io;
use ada.integer_text_io;
with ada.text_io;
use ada.text_io;
with commandline_args;
use commandline_args;
with box;
use box;

procedure boites is
    box : box_t;
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

    box := initialize_box(get_t, get_w, get_l, get_h, get_q, get_b);
    put_line(to_string(box));

    
end;
