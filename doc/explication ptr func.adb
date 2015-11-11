procedure poulet_au() is
    poulet : integer;
begin
    couper(poulet); 

    revenir(poulet);


    servir(poulet);
end;

procedure poulet_au(recette : access procedure (poulet : integer)) is
    poulet : integer;
begin
    couper(poulet); 

    revenir(poulet);

    recette(poulet);

    servir(poulet);
end;

procedure flamber(poulet : integer) is
begin
    -- poulet on fire
end;

procedure salerpoivrerpaprika(poulet : integer) is
begin
    -- spp
end;

procedure rien(poulet : integer) is
begin
    null;
end;

poulet_au(salerpoivrerpaprika'access);


