with ada.characters.latin_1;

package body help is
    function show_help return string is
        tab : constant character := ada.characters.latin_1.HT;
        lf : constant character := ada.characters.latin_1.LF;
    begin
        return "NOM" & lf
        & tab & "boites - sauvegarde un fichier svg affichant une boite (3 demi-boites)" & lf
        & "SYNOPSIS" & lf
        & tab & "./boites [OPTIONS]" & lf
        & "DESCRIPTION" & lf
        & tab & "./boites prend obligatoirement en option les paramètres -t,-l,-w,-q,-h,-b et facultativement les paramètres --fill et --border." & lf
        & "OPTIONS" & lf
        & tab & "-t INT : épaisseur" & lf
        & tab & "-l INT : longueur" & lf
        & tab & "-w INT : largeur" & lf
        & tab & "-q INT : longueur des queues et des encoches" & lf
        & tab & "-h INT : hauteur" & lf
        & tab & "-b INT : hauteur interne" & lf
        & tab & "--fill COLOR : remplit les polygones de la couleur COLOR. Par défaut COLOR=white" & lf
        & tab & "--border COLOR : change la couleur de la bordure avec COLOR. Par défaut COLOR=red";
    end;
end help;
