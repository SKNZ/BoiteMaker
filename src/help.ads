with ada.characters.latin_1;

package help is
    -- affiche l'aide
    procedure show_help;

    private

    tab : constant character := ada.characters.latin_1.HT;
    lf : constant character := ada.characters.latin_1.LF;

    help_text : constant string := 
        "BoiteMaker" & lf
        & tab & "boites - sauvegarde un fichier svg affichant une boite (3 demi-boites)" & lf
        & tab & "Par Robin VINCENT-DELEUZE & Floran NARENJI-SHESHKALANI" & lf & lf
        & "SYNOPSIS" & lf
        & tab & "./boites [OPTION]" & lf & lf
        & "DESCRIPTION" & lf
        & tab & "./boites prend obligatoirement en option les paramètres -t,-l,-w,-q,-h,-b et facultativement les paramètres --fill, --border, --show-debug, --log, --pattern." & lf
        & "OPTIONS" & lf
        & tab & "-t INT : épaisseur" & lf
        & tab & "-l INT : longueur" & lf
        & tab & "-w INT : largeur" & lf
        & tab & "-q INT : longueur des queues et des encoches" & lf
        & tab & "-h INT : hauteur" & lf
        & tab & "-b INT : hauteur interne" & lf
        & tab & "--fill COLOR : remplit les polygones de la couleur COLOR. Par défaut COLOR=white" & lf
        & tab & "--border COLOR : change la couleur de la bordure avec COLOR. Par défaut COLOR=red" & lf
        & tab & "--pattern IMAGE_FILE : REQUIERT IMAGEMAGICK. Remplit les polygones avec l'image fournie en paramètre. Désactivé par défaut." & lf
        & tab & "--show-debug : affiche les informations de deboggages sur la sortie standarde. Désactivé par défaut." & lf
        & tab & "--log FILE : inscrit les informations de deboggages dans un fichier. Désactivé par défaut." & lf;
end help;
