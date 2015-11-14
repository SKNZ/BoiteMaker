package logger is
    procedure debug(output : string);

    procedure set_show_debug(show : boolean);

    private
    show_debug : boolean := false;
end logger;
