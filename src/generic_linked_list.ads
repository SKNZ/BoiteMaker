generic
    type element_t is private;
package generic_linked_list is
    -- Exception levée en l'absence de noeud
    no_node : exception;

    -- Forward declaration du type node_t
    -- car celui contient de pointeur de son type
    -- et qu'on souhaite utiliser l'alias node_ptr
    type node_t is private;

    -- Déclaration du type pointeur vers node_t
    type node_ptr is access node_t;

    -- Créer une liste chaine avec un élément
    -- Renvoie le noeud de la chaine crée
    -- ATTENTION: destroy la liste une fois son utilisation terminée
    --              sinon risque de fuite mémoire
    function create(element : element_t) return node_ptr;

    -- Ajoute un élément à la fin de la liste chainée
    function add_after(node : node_ptr; element : element_t) return node_ptr;

    -- Retire l'élement suivant l'élément passé en
    -- paramètre de la liste chainée
    -- Exception: no_node si aucun noeud suivant
    procedure remove_next(node : node_ptr);

    -- Indique si la liste contient un élément suivant
    function has_next(node : node_ptr) return boolean;

    -- Avance au noeud suivant
    -- Exception: no_node si aucun noeud suivant
    function move_next(node : node_ptr) return node_ptr;

    -- Renvoie l'élément porté par le noeud
    function elem(node : node_ptr) return element_t;

    -- Détruit la liste (noeud courrant & noeuds suivants)
    -- Les noeuds avant le noeud passé en paramètre sont ignorés
    procedure destroy(node : in out node_ptr);

    private

    -- Implémentation du type node_t
    -- privé
    type node_t is
        record
            -- l'élément porté par le noeud
            element : element_t;

            -- le noeud suivant
            next_node : node_ptr;
        end record;
end generic_linked_list;
