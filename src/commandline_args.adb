with gnat.command_line;
use gnat.command_line;

package body commandline_args is
    procedure initialize is
    begin
        loop
            case getopt("t: l: w: q: h: b: f:") is
                when 't' =>
                    t := Integer'Value(Parameter);
                when others =>
                    exit;
            end case;
        end loop;
    end;
end commandline_args;
