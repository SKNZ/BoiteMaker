package body generic_linked_list is
    function create(element : element_t) return node_ptr is
        node : node_ptr := new node_t;
    begin
        node.all := (element => element, next_node => null);
        return node; 
    end;

    function add_after(node : node_ptr; element : element_t) return node_ptr is
        new_node : node_ptr := new node_t;
    begin
        new_node.all := (element => element, next_node => null);
        node.next_node := new_node;

        return new_node;
    end;

    procedure remove_next(node : node_ptr) is
    begin
        if node.next_node = null then
            raise no_node; 
        end if;

        node.next_node := node.next_node.next_node;
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
end generic_linked_list;
