with ada.text_io;
use ada.text_io;

package body text_file_writer is
    procedure write_string_to_file(file_path, content : string) is
        file : file_type;
    begin
        begin
            open(file, out_file, file_path);
        exception
            when name_error =>
                create(file, out_file, file_path);
        end;

        put(file, content);
        close(file);
    end;
end text_file_writer;
