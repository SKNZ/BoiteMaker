with ada.strings.unbounded;
use ada.strings.unbounded;

package imagemagick is
    imagemagick_failure : exception;

    -- transforme l'image passée en chaine base64 et obtient ses dimensions 
    procedure get_base64(file : string; base64 : out unbounded_string; width, height : out integer);

    private

    base64_temp_file : constant string := "base64.txt";
end imagemagick;
