package body box is
    function initialize_box(t, h, w, l, q, b : integer) return box_t is
        box : box_t := (thickness => t,
                    height => h,
                    width => w,
                    length => l,
                    queue_length => q,
                    inner_height => b);
    begin
        return box;
    end;

    procedure validate_box_measurements(box : box_t) is
    begin
        null;
    end;
end box;
