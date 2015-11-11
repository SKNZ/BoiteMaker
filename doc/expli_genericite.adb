procedure mv_l(point : in out point_t; delta_x : integer) is
begin
    mv_l(point, float(delta_x));
end;

procedure int_mv(point : in out point_t; delta_axis : integer; mv : access procedure(point : in out point_t; delta_axis : float)) is
begin
    mv(point, float(delta_axis));
end;

int_mv(point, delta_x, mv_l_ptr);

mv_l(point, float(delta_x));

mv_l(point, delta_x);

generic
    mv : mv_ptr; 
procedure int_mv(point : in out point_t; delta_axis : integer);

procedure int_mv(point : in out point_t; delta_axis : integer) is 
begin
    mv(point, float(delta_axis * mult));
end;

procedure internal_int_mv_l is new int_mv(mv_l_ptr);
procedure internal_int_mv_r is new int_mv(mv_r_ptr);
procedure internal_int_mv_u is new int_mv(mv_u_ptr);
procedure internal_int_mv_d is new int_mv(mv_d_ptr);

-- definition des fonctions de mouvement (celles-ci sont déclarées dans le package)
procedure mv_l(point : in out point_t; delta_x : integer) renames internal_int_mv_l;
procedure mv_r(point : in out point_t; delta_x : integer) renames internal_int_mv_r;
procedure mv_u(point : in out point_t; delta_y : integer) renames internal_int_mv_u;
procedure mv_d(point : in out point_t; delta_y : integer) renames internal_int_mv_d;
