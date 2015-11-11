with ada.unchecked_deallocation;
with ada.characters.latin_1;
use ada.characters.latin_1;


package body generic_linked_list is
    -- Instanciation du deallocateur pour le pool d'access node_t
    procedure node_unchecked_deallocation is new ada.unchecked_deallocation(node_t, node_ptr);

    function create(element : element_t) return node_ptr is
        node : node_ptr := new node_t;
    begin
        node.all := (element => element, next_node => null);
        return node; 
    end;

    function add_after(node : node_ptr; element : element_t) return node_ptr is
    begin
        add_after(node, element);
        return move_next(node);
    end;

    procedure add_after(node : node_ptr; element : element_t) is
        new_node : node_ptr := new node_t;
    begin
        new_node.all := (element => element, next_node => null);
        node.next_node := new_node;
    end;

    procedure remove_next(node : node_ptr) is
        next_node : node_ptr := node.next_node;
    begin
        if next_node = null then
            raise no_node; 
        end if;

        -- Supprime le noeud de la chaine
        node.next_node := next_node.next_node;

        -- Libération de la mémoire du noeud
        node_unchecked_deallocation(next_node);
    end;

    function has_next(node : node_ptr) return boolean is
    begin
        return node.next_node /= null;
    end;

    function move_next(node : node_ptr) return node_ptr is
    begin
        if node.next_node = null then
            raise no_node;
        end if;

        return node.next_node;
    end;

    function elem(node : node_ptr) return element_t is
    begin
        return node.all.element;
    end;

    procedure destroy(node : in out node_ptr) is
    begin
        if has_next(node) then
            destroy(node.next_node);
        end if;

        node_unchecked_deallocation(node);
    end;

    function to_string(node : node_ptr; to_string : to_string_function_t) return string is
        -- Helper de récursion permettant la génération de la chaine pour le to_string
        function to_string_helper(node : node_ptr; to_string : to_string_function_t) return string is
            s : string := ada.characters.latin_1.HT & to_string.all(elem(node));
        begin
            if has_next(node) then
                return s
                    & ','
                    & ada.characters.latin_1.LF
                    & to_string_helper(move_next(node), to_string);
            end if;

            return s & ada.characters.latin_1.LF;
        end;
    begin
        return "["
            & ada.characters.latin_1.LF
            & to_string_helper(node, to_string)
            & ada.characters.latin_1.HT
            & "]";
    end;

end generic_linked_list;
