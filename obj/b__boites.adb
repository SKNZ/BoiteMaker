pragma Ada_95;
pragma Source_File_Name (ada_main, Spec_File_Name => "b__boites.ads");
pragma Source_File_Name (ada_main, Body_File_Name => "b__boites.adb");
pragma Suppress (Overflow_Check);
with Ada.Exceptions;

package body ada_main is
   pragma Warnings (Off);

   E076 : Short_Integer; pragma Import (Ada, E076, "system__os_lib_E");
   E013 : Short_Integer; pragma Import (Ada, E013, "system__soft_links_E");
   E019 : Short_Integer; pragma Import (Ada, E019, "system__exception_table_E");
   E050 : Short_Integer; pragma Import (Ada, E050, "ada__io_exceptions_E");
   E111 : Short_Integer; pragma Import (Ada, E111, "ada__strings_E");
   E113 : Short_Integer; pragma Import (Ada, E113, "ada__strings__maps_E");
   E116 : Short_Integer; pragma Import (Ada, E116, "ada__strings__maps__constants_E");
   E052 : Short_Integer; pragma Import (Ada, E052, "ada__tags_E");
   E049 : Short_Integer; pragma Import (Ada, E049, "ada__streams_E");
   E074 : Short_Integer; pragma Import (Ada, E074, "interfaces__c_E");
   E021 : Short_Integer; pragma Import (Ada, E021, "system__exceptions_E");
   E079 : Short_Integer; pragma Import (Ada, E079, "system__file_control_block_E");
   E068 : Short_Integer; pragma Import (Ada, E068, "system__file_io_E");
   E072 : Short_Integer; pragma Import (Ada, E072, "system__finalization_root_E");
   E070 : Short_Integer; pragma Import (Ada, E070, "ada__finalization_E");
   E136 : Short_Integer; pragma Import (Ada, E136, "system__storage_pools_E");
   E130 : Short_Integer; pragma Import (Ada, E130, "system__finalization_masters_E");
   E126 : Short_Integer; pragma Import (Ada, E126, "system__storage_pools__subpools_E");
   E144 : Short_Integer; pragma Import (Ada, E144, "gnat__directory_operations_E");
   E149 : Short_Integer; pragma Import (Ada, E149, "system__pool_global_E");
   E009 : Short_Integer; pragma Import (Ada, E009, "system__secondary_stack_E");
   E118 : Short_Integer; pragma Import (Ada, E118, "ada__strings__unbounded_E");
   E154 : Short_Integer; pragma Import (Ada, E154, "system__regexp_E");
   E108 : Short_Integer; pragma Import (Ada, E108, "gnat__command_line_E");
   E047 : Short_Integer; pragma Import (Ada, E047, "ada__text_io_E");
   E101 : Short_Integer; pragma Import (Ada, E101, "box_E");
   E105 : Short_Integer; pragma Import (Ada, E105, "commandline_args_E");
   E157 : Short_Integer; pragma Import (Ada, E157, "generic_linked_list_E");

   Local_Priority_Specific_Dispatching : constant String := "";
   Local_Interrupt_States : constant String := "";

   Is_Elaborated : Boolean := False;

   procedure finalize_library is
   begin
      E047 := E047 - 1;
      declare
         procedure F1;
         pragma Import (Ada, F1, "ada__text_io__finalize_spec");
      begin
         F1;
      end;
      E154 := E154 - 1;
      declare
         procedure F2;
         pragma Import (Ada, F2, "system__regexp__finalize_spec");
      begin
         F2;
      end;
      E118 := E118 - 1;
      declare
         procedure F3;
         pragma Import (Ada, F3, "ada__strings__unbounded__finalize_spec");
      begin
         F3;
      end;
      declare
         procedure F4;
         pragma Import (Ada, F4, "system__file_io__finalize_body");
      begin
         E068 := E068 - 1;
         F4;
      end;
      E130 := E130 - 1;
      E126 := E126 - 1;
      E149 := E149 - 1;
      declare
         procedure F5;
         pragma Import (Ada, F5, "system__pool_global__finalize_spec");
      begin
         F5;
      end;
      declare
         procedure F6;
         pragma Import (Ada, F6, "system__storage_pools__subpools__finalize_spec");
      begin
         F6;
      end;
      declare
         procedure F7;
         pragma Import (Ada, F7, "system__finalization_masters__finalize_spec");
      begin
         F7;
      end;
      declare
         procedure Reraise_Library_Exception_If_Any;
            pragma Import (Ada, Reraise_Library_Exception_If_Any, "__gnat_reraise_library_exception_if_any");
      begin
         Reraise_Library_Exception_If_Any;
      end;
   end finalize_library;

   procedure adafinal is
      procedure s_stalib_adafinal;
      pragma Import (C, s_stalib_adafinal, "system__standard_library__adafinal");

      procedure Runtime_Finalize;
      pragma Import (C, Runtime_Finalize, "__gnat_runtime_finalize");

   begin
      if not Is_Elaborated then
         return;
      end if;
      Is_Elaborated := False;
      Runtime_Finalize;
      s_stalib_adafinal;
   end adafinal;

   type No_Param_Proc is access procedure;

   procedure adainit is
      Main_Priority : Integer;
      pragma Import (C, Main_Priority, "__gl_main_priority");
      Time_Slice_Value : Integer;
      pragma Import (C, Time_Slice_Value, "__gl_time_slice_val");
      WC_Encoding : Character;
      pragma Import (C, WC_Encoding, "__gl_wc_encoding");
      Locking_Policy : Character;
      pragma Import (C, Locking_Policy, "__gl_locking_policy");
      Queuing_Policy : Character;
      pragma Import (C, Queuing_Policy, "__gl_queuing_policy");
      Task_Dispatching_Policy : Character;
      pragma Import (C, Task_Dispatching_Policy, "__gl_task_dispatching_policy");
      Priority_Specific_Dispatching : System.Address;
      pragma Import (C, Priority_Specific_Dispatching, "__gl_priority_specific_dispatching");
      Num_Specific_Dispatching : Integer;
      pragma Import (C, Num_Specific_Dispatching, "__gl_num_specific_dispatching");
      Main_CPU : Integer;
      pragma Import (C, Main_CPU, "__gl_main_cpu");
      Interrupt_States : System.Address;
      pragma Import (C, Interrupt_States, "__gl_interrupt_states");
      Num_Interrupt_States : Integer;
      pragma Import (C, Num_Interrupt_States, "__gl_num_interrupt_states");
      Unreserve_All_Interrupts : Integer;
      pragma Import (C, Unreserve_All_Interrupts, "__gl_unreserve_all_interrupts");
      Detect_Blocking : Integer;
      pragma Import (C, Detect_Blocking, "__gl_detect_blocking");
      Default_Stack_Size : Integer;
      pragma Import (C, Default_Stack_Size, "__gl_default_stack_size");
      Leap_Seconds_Support : Integer;
      pragma Import (C, Leap_Seconds_Support, "__gl_leap_seconds_support");

      procedure Runtime_Initialize (Install_Handler : Integer);
      pragma Import (C, Runtime_Initialize, "__gnat_runtime_initialize");

      Finalize_Library_Objects : No_Param_Proc;
      pragma Import (C, Finalize_Library_Objects, "__gnat_finalize_library_objects");
   begin
      if Is_Elaborated then
         return;
      end if;
      Is_Elaborated := True;
      Main_Priority := -1;
      Time_Slice_Value := -1;
      WC_Encoding := 'b';
      Locking_Policy := ' ';
      Queuing_Policy := ' ';
      Task_Dispatching_Policy := ' ';
      Priority_Specific_Dispatching :=
        Local_Priority_Specific_Dispatching'Address;
      Num_Specific_Dispatching := 0;
      Main_CPU := -1;
      Interrupt_States := Local_Interrupt_States'Address;
      Num_Interrupt_States := 0;
      Unreserve_All_Interrupts := 0;
      Detect_Blocking := 0;
      Default_Stack_Size := -1;
      Leap_Seconds_Support := 0;

      Runtime_Initialize (1);

      Finalize_Library_Objects := finalize_library'access;

      System.Soft_Links'Elab_Spec;
      System.Exception_Table'Elab_Body;
      E019 := E019 + 1;
      Ada.Io_Exceptions'Elab_Spec;
      E050 := E050 + 1;
      Ada.Strings'Elab_Spec;
      E111 := E111 + 1;
      Ada.Strings.Maps'Elab_Spec;
      Ada.Strings.Maps.Constants'Elab_Spec;
      E116 := E116 + 1;
      Ada.Tags'Elab_Spec;
      Ada.Streams'Elab_Spec;
      E049 := E049 + 1;
      Interfaces.C'Elab_Spec;
      System.Exceptions'Elab_Spec;
      E021 := E021 + 1;
      System.File_Control_Block'Elab_Spec;
      E079 := E079 + 1;
      System.Finalization_Root'Elab_Spec;
      E072 := E072 + 1;
      Ada.Finalization'Elab_Spec;
      E070 := E070 + 1;
      System.Storage_Pools'Elab_Spec;
      E136 := E136 + 1;
      System.Finalization_Masters'Elab_Spec;
      System.Storage_Pools.Subpools'Elab_Spec;
      Gnat.Directory_Operations'Elab_Spec;
      System.Pool_Global'Elab_Spec;
      E149 := E149 + 1;
      E126 := E126 + 1;
      System.Finalization_Masters'Elab_Body;
      E130 := E130 + 1;
      System.File_Io'Elab_Body;
      E068 := E068 + 1;
      E074 := E074 + 1;
      Ada.Tags'Elab_Body;
      E052 := E052 + 1;
      E113 := E113 + 1;
      System.Soft_Links'Elab_Body;
      E013 := E013 + 1;
      System.Os_Lib'Elab_Body;
      E076 := E076 + 1;
      System.Secondary_Stack'Elab_Body;
      E009 := E009 + 1;
      Gnat.Directory_Operations'Elab_Body;
      E144 := E144 + 1;
      Ada.Strings.Unbounded'Elab_Spec;
      E118 := E118 + 1;
      System.Regexp'Elab_Spec;
      E154 := E154 + 1;
      Gnat.Command_Line'Elab_Spec;
      Ada.Text_Io'Elab_Spec;
      Ada.Text_Io'Elab_Body;
      E047 := E047 + 1;
      Gnat.Command_Line'Elab_Body;
      E108 := E108 + 1;
      E101 := E101 + 1;
      commandline_args'elab_spec;
      E105 := E105 + 1;
      E157 := E157 + 1;
   end adainit;

   procedure Ada_Main_Program;
   pragma Import (Ada, Ada_Main_Program, "_ada_boites");

   function main
     (argc : Integer;
      argv : System.Address;
      envp : System.Address)
      return Integer
   is
      procedure Initialize (Addr : System.Address);
      pragma Import (C, Initialize, "__gnat_initialize");

      procedure Finalize;
      pragma Import (C, Finalize, "__gnat_finalize");
      SEH : aliased array (1 .. 2) of Integer;

      Ensure_Reference : aliased System.Address := Ada_Main_Program_Name'Address;
      pragma Volatile (Ensure_Reference);

   begin
      gnat_argc := argc;
      gnat_argv := argv;
      gnat_envp := envp;

      Initialize (SEH'Address);
      adainit;
      Ada_Main_Program;
      adafinal;
      Finalize;
      return (gnat_exit_status);
   end;

--  BEGIN Object file/option list
   --   /user/5/.base/narenjif/home/dev/BoiteMaker/obj/box.o
   --   /user/5/.base/narenjif/home/dev/BoiteMaker/obj/commandline_args.o
   --   /user/5/.base/narenjif/home/dev/BoiteMaker/obj/generic_linked_list.o
   --   /user/5/.base/narenjif/home/dev/BoiteMaker/obj/boites.o
   --   -L/user/5/.base/narenjif/home/dev/BoiteMaker/obj/
   --   -L/user/5/.base/narenjif/home/dev/BoiteMaker/obj/
   --   -L/opt/gnat/lib/gcc/x86_64-pc-linux-gnu/4.9.3/adalib/
   --   -static
   --   -lgnat
--  END Object file/option list   

end ada_main;