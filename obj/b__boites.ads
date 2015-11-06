pragma Ada_95;
with System;
package ada_main is
   pragma Warnings (Off);

   gnat_argc : Integer;
   gnat_argv : System.Address;
   gnat_envp : System.Address;

   pragma Import (C, gnat_argc);
   pragma Import (C, gnat_argv);
   pragma Import (C, gnat_envp);

   gnat_exit_status : Integer;
   pragma Import (C, gnat_exit_status);

   GNAT_Version : constant String :=
                    "GNAT Version: GPL 2015 (20150428-49)" & ASCII.NUL;
   pragma Export (C, GNAT_Version, "__gnat_version");

   Ada_Main_Program_Name : constant String := "_ada_boites" & ASCII.NUL;
   pragma Export (C, Ada_Main_Program_Name, "__gnat_ada_main_program_name");

   procedure adainit;
   pragma Export (C, adainit, "adainit");

   procedure adafinal;
   pragma Export (C, adafinal, "adafinal");

   function main
     (argc : Integer;
      argv : System.Address;
      envp : System.Address)
      return Integer;
   pragma Export (C, main, "main");

   type Version_32 is mod 2 ** 32;
   u00001 : constant Version_32 := 16#852c9c87#;
   pragma Export (C, u00001, "boitesB");
   u00002 : constant Version_32 := 16#fbff4c67#;
   pragma Export (C, u00002, "system__standard_libraryB");
   u00003 : constant Version_32 := 16#1ec6fd90#;
   pragma Export (C, u00003, "system__standard_libraryS");
   u00004 : constant Version_32 := 16#3ffc8e18#;
   pragma Export (C, u00004, "adaS");
   u00005 : constant Version_32 := 16#9b14b3ac#;
   pragma Export (C, u00005, "ada__command_lineB");
   u00006 : constant Version_32 := 16#d59e21a4#;
   pragma Export (C, u00006, "ada__command_lineS");
   u00007 : constant Version_32 := 16#1d274481#;
   pragma Export (C, u00007, "systemS");
   u00008 : constant Version_32 := 16#b19b6653#;
   pragma Export (C, u00008, "system__secondary_stackB");
   u00009 : constant Version_32 := 16#b6468be8#;
   pragma Export (C, u00009, "system__secondary_stackS");
   u00010 : constant Version_32 := 16#b01dad17#;
   pragma Export (C, u00010, "system__parametersB");
   u00011 : constant Version_32 := 16#630d49fe#;
   pragma Export (C, u00011, "system__parametersS");
   u00012 : constant Version_32 := 16#a207fefe#;
   pragma Export (C, u00012, "system__soft_linksB");
   u00013 : constant Version_32 := 16#467d9556#;
   pragma Export (C, u00013, "system__soft_linksS");
   u00014 : constant Version_32 := 16#2c143749#;
   pragma Export (C, u00014, "ada__exceptionsB");
   u00015 : constant Version_32 := 16#f4f0cce8#;
   pragma Export (C, u00015, "ada__exceptionsS");
   u00016 : constant Version_32 := 16#a46739c0#;
   pragma Export (C, u00016, "ada__exceptions__last_chance_handlerB");
   u00017 : constant Version_32 := 16#3aac8c92#;
   pragma Export (C, u00017, "ada__exceptions__last_chance_handlerS");
   u00018 : constant Version_32 := 16#393398c1#;
   pragma Export (C, u00018, "system__exception_tableB");
   u00019 : constant Version_32 := 16#b33e2294#;
   pragma Export (C, u00019, "system__exception_tableS");
   u00020 : constant Version_32 := 16#ce4af020#;
   pragma Export (C, u00020, "system__exceptionsB");
   u00021 : constant Version_32 := 16#75442977#;
   pragma Export (C, u00021, "system__exceptionsS");
   u00022 : constant Version_32 := 16#37d758f1#;
   pragma Export (C, u00022, "system__exceptions__machineS");
   u00023 : constant Version_32 := 16#b895431d#;
   pragma Export (C, u00023, "system__exceptions_debugB");
   u00024 : constant Version_32 := 16#aec55d3f#;
   pragma Export (C, u00024, "system__exceptions_debugS");
   u00025 : constant Version_32 := 16#570325c8#;
   pragma Export (C, u00025, "system__img_intB");
   u00026 : constant Version_32 := 16#1ffca443#;
   pragma Export (C, u00026, "system__img_intS");
   u00027 : constant Version_32 := 16#39a03df9#;
   pragma Export (C, u00027, "system__storage_elementsB");
   u00028 : constant Version_32 := 16#30e40e85#;
   pragma Export (C, u00028, "system__storage_elementsS");
   u00029 : constant Version_32 := 16#b98c3e16#;
   pragma Export (C, u00029, "system__tracebackB");
   u00030 : constant Version_32 := 16#831a9d5a#;
   pragma Export (C, u00030, "system__tracebackS");
   u00031 : constant Version_32 := 16#9ed49525#;
   pragma Export (C, u00031, "system__traceback_entriesB");
   u00032 : constant Version_32 := 16#1d7cb2f1#;
   pragma Export (C, u00032, "system__traceback_entriesS");
   u00033 : constant Version_32 := 16#8c33a517#;
   pragma Export (C, u00033, "system__wch_conB");
   u00034 : constant Version_32 := 16#065a6653#;
   pragma Export (C, u00034, "system__wch_conS");
   u00035 : constant Version_32 := 16#9721e840#;
   pragma Export (C, u00035, "system__wch_stwB");
   u00036 : constant Version_32 := 16#2b4b4a52#;
   pragma Export (C, u00036, "system__wch_stwS");
   u00037 : constant Version_32 := 16#92b797cb#;
   pragma Export (C, u00037, "system__wch_cnvB");
   u00038 : constant Version_32 := 16#09eddca0#;
   pragma Export (C, u00038, "system__wch_cnvS");
   u00039 : constant Version_32 := 16#6033a23f#;
   pragma Export (C, u00039, "interfacesS");
   u00040 : constant Version_32 := 16#ece6fdb6#;
   pragma Export (C, u00040, "system__wch_jisB");
   u00041 : constant Version_32 := 16#899dc581#;
   pragma Export (C, u00041, "system__wch_jisS");
   u00042 : constant Version_32 := 16#41837d1e#;
   pragma Export (C, u00042, "system__stack_checkingB");
   u00043 : constant Version_32 := 16#93982f69#;
   pragma Export (C, u00043, "system__stack_checkingS");
   u00044 : constant Version_32 := 16#f64b89a4#;
   pragma Export (C, u00044, "ada__integer_text_ioB");
   u00045 : constant Version_32 := 16#f1daf268#;
   pragma Export (C, u00045, "ada__integer_text_ioS");
   u00046 : constant Version_32 := 16#28f088c2#;
   pragma Export (C, u00046, "ada__text_ioB");
   u00047 : constant Version_32 := 16#f372c8ac#;
   pragma Export (C, u00047, "ada__text_ioS");
   u00048 : constant Version_32 := 16#10558b11#;
   pragma Export (C, u00048, "ada__streamsB");
   u00049 : constant Version_32 := 16#2e6701ab#;
   pragma Export (C, u00049, "ada__streamsS");
   u00050 : constant Version_32 := 16#db5c917c#;
   pragma Export (C, u00050, "ada__io_exceptionsS");
   u00051 : constant Version_32 := 16#12c8cd7d#;
   pragma Export (C, u00051, "ada__tagsB");
   u00052 : constant Version_32 := 16#ce72c228#;
   pragma Export (C, u00052, "ada__tagsS");
   u00053 : constant Version_32 := 16#c3335bfd#;
   pragma Export (C, u00053, "system__htableB");
   u00054 : constant Version_32 := 16#99e5f76b#;
   pragma Export (C, u00054, "system__htableS");
   u00055 : constant Version_32 := 16#089f5cd0#;
   pragma Export (C, u00055, "system__string_hashB");
   u00056 : constant Version_32 := 16#3bbb9c15#;
   pragma Export (C, u00056, "system__string_hashS");
   u00057 : constant Version_32 := 16#807fe041#;
   pragma Export (C, u00057, "system__unsigned_typesS");
   u00058 : constant Version_32 := 16#06052bd0#;
   pragma Export (C, u00058, "system__val_lluB");
   u00059 : constant Version_32 := 16#fa8db733#;
   pragma Export (C, u00059, "system__val_lluS");
   u00060 : constant Version_32 := 16#27b600b2#;
   pragma Export (C, u00060, "system__val_utilB");
   u00061 : constant Version_32 := 16#b187f27f#;
   pragma Export (C, u00061, "system__val_utilS");
   u00062 : constant Version_32 := 16#d1060688#;
   pragma Export (C, u00062, "system__case_utilB");
   u00063 : constant Version_32 := 16#392e2d56#;
   pragma Export (C, u00063, "system__case_utilS");
   u00064 : constant Version_32 := 16#84a27f0d#;
   pragma Export (C, u00064, "interfaces__c_streamsB");
   u00065 : constant Version_32 := 16#8bb5f2c0#;
   pragma Export (C, u00065, "interfaces__c_streamsS");
   u00066 : constant Version_32 := 16#6db6928f#;
   pragma Export (C, u00066, "system__crtlS");
   u00067 : constant Version_32 := 16#431faf3c#;
   pragma Export (C, u00067, "system__file_ioB");
   u00068 : constant Version_32 := 16#ba56a5e4#;
   pragma Export (C, u00068, "system__file_ioS");
   u00069 : constant Version_32 := 16#b7ab275c#;
   pragma Export (C, u00069, "ada__finalizationB");
   u00070 : constant Version_32 := 16#19f764ca#;
   pragma Export (C, u00070, "ada__finalizationS");
   u00071 : constant Version_32 := 16#95817ed8#;
   pragma Export (C, u00071, "system__finalization_rootB");
   u00072 : constant Version_32 := 16#52d53711#;
   pragma Export (C, u00072, "system__finalization_rootS");
   u00073 : constant Version_32 := 16#769e25e6#;
   pragma Export (C, u00073, "interfaces__cB");
   u00074 : constant Version_32 := 16#4a38bedb#;
   pragma Export (C, u00074, "interfaces__cS");
   u00075 : constant Version_32 := 16#07e6ee66#;
   pragma Export (C, u00075, "system__os_libB");
   u00076 : constant Version_32 := 16#d7b69782#;
   pragma Export (C, u00076, "system__os_libS");
   u00077 : constant Version_32 := 16#1a817b8e#;
   pragma Export (C, u00077, "system__stringsB");
   u00078 : constant Version_32 := 16#639855e7#;
   pragma Export (C, u00078, "system__stringsS");
   u00079 : constant Version_32 := 16#e0b8de29#;
   pragma Export (C, u00079, "system__file_control_blockS");
   u00080 : constant Version_32 := 16#f6fdca1c#;
   pragma Export (C, u00080, "ada__text_io__integer_auxB");
   u00081 : constant Version_32 := 16#b9793d30#;
   pragma Export (C, u00081, "ada__text_io__integer_auxS");
   u00082 : constant Version_32 := 16#181dc502#;
   pragma Export (C, u00082, "ada__text_io__generic_auxB");
   u00083 : constant Version_32 := 16#a6c327d3#;
   pragma Export (C, u00083, "ada__text_io__generic_auxS");
   u00084 : constant Version_32 := 16#18d57884#;
   pragma Export (C, u00084, "system__img_biuB");
   u00085 : constant Version_32 := 16#465d680c#;
   pragma Export (C, u00085, "system__img_biuS");
   u00086 : constant Version_32 := 16#e7d8734f#;
   pragma Export (C, u00086, "system__img_llbB");
   u00087 : constant Version_32 := 16#079a78f2#;
   pragma Export (C, u00087, "system__img_llbS");
   u00088 : constant Version_32 := 16#9777733a#;
   pragma Export (C, u00088, "system__img_lliB");
   u00089 : constant Version_32 := 16#0c681150#;
   pragma Export (C, u00089, "system__img_lliS");
   u00090 : constant Version_32 := 16#0e8808d4#;
   pragma Export (C, u00090, "system__img_llwB");
   u00091 : constant Version_32 := 16#aef65b64#;
   pragma Export (C, u00091, "system__img_llwS");
   u00092 : constant Version_32 := 16#428b07f8#;
   pragma Export (C, u00092, "system__img_wiuB");
   u00093 : constant Version_32 := 16#281cef9e#;
   pragma Export (C, u00093, "system__img_wiuS");
   u00094 : constant Version_32 := 16#7ebd8839#;
   pragma Export (C, u00094, "system__val_intB");
   u00095 : constant Version_32 := 16#55826ebe#;
   pragma Export (C, u00095, "system__val_intS");
   u00096 : constant Version_32 := 16#b44f9ae7#;
   pragma Export (C, u00096, "system__val_unsB");
   u00097 : constant Version_32 := 16#90d70d7a#;
   pragma Export (C, u00097, "system__val_unsS");
   u00098 : constant Version_32 := 16#b3aa7b17#;
   pragma Export (C, u00098, "system__val_lliB");
   u00099 : constant Version_32 := 16#8703a221#;
   pragma Export (C, u00099, "system__val_lliS");
   u00100 : constant Version_32 := 16#32dd40e4#;
   pragma Export (C, u00100, "boxB");
   u00101 : constant Version_32 := 16#e3ddf207#;
   pragma Export (C, u00101, "boxS");
   u00102 : constant Version_32 := 16#12c24a43#;
   pragma Export (C, u00102, "ada__charactersS");
   u00103 : constant Version_32 := 16#4b7bb96a#;
   pragma Export (C, u00103, "ada__characters__latin_1S");
   u00104 : constant Version_32 := 16#a64701a7#;
   pragma Export (C, u00104, "commandline_argsB");
   u00105 : constant Version_32 := 16#8a9648dd#;
   pragma Export (C, u00105, "commandline_argsS");
   u00106 : constant Version_32 := 16#fd2ad2f1#;
   pragma Export (C, u00106, "gnatS");
   u00107 : constant Version_32 := 16#a8b4ea59#;
   pragma Export (C, u00107, "gnat__command_lineB");
   u00108 : constant Version_32 := 16#c4427fe3#;
   pragma Export (C, u00108, "gnat__command_lineS");
   u00109 : constant Version_32 := 16#8f637df8#;
   pragma Export (C, u00109, "ada__characters__handlingB");
   u00110 : constant Version_32 := 16#3b3f6154#;
   pragma Export (C, u00110, "ada__characters__handlingS");
   u00111 : constant Version_32 := 16#af50e98f#;
   pragma Export (C, u00111, "ada__stringsS");
   u00112 : constant Version_32 := 16#e2ea8656#;
   pragma Export (C, u00112, "ada__strings__mapsB");
   u00113 : constant Version_32 := 16#1e526bec#;
   pragma Export (C, u00113, "ada__strings__mapsS");
   u00114 : constant Version_32 := 16#a87ab9e2#;
   pragma Export (C, u00114, "system__bit_opsB");
   u00115 : constant Version_32 := 16#0765e3a3#;
   pragma Export (C, u00115, "system__bit_opsS");
   u00116 : constant Version_32 := 16#92f05f13#;
   pragma Export (C, u00116, "ada__strings__maps__constantsS");
   u00117 : constant Version_32 := 16#f78329ae#;
   pragma Export (C, u00117, "ada__strings__unboundedB");
   u00118 : constant Version_32 := 16#e303cf90#;
   pragma Export (C, u00118, "ada__strings__unboundedS");
   u00119 : constant Version_32 := 16#3bc8a117#;
   pragma Export (C, u00119, "ada__strings__searchB");
   u00120 : constant Version_32 := 16#c1ab8667#;
   pragma Export (C, u00120, "ada__strings__searchS");
   u00121 : constant Version_32 := 16#5b9edcc4#;
   pragma Export (C, u00121, "system__compare_array_unsigned_8B");
   u00122 : constant Version_32 := 16#b424350c#;
   pragma Export (C, u00122, "system__compare_array_unsigned_8S");
   u00123 : constant Version_32 := 16#5f72f755#;
   pragma Export (C, u00123, "system__address_operationsB");
   u00124 : constant Version_32 := 16#0e2bfab2#;
   pragma Export (C, u00124, "system__address_operationsS");
   u00125 : constant Version_32 := 16#6a859064#;
   pragma Export (C, u00125, "system__storage_pools__subpoolsB");
   u00126 : constant Version_32 := 16#e3b008dc#;
   pragma Export (C, u00126, "system__storage_pools__subpoolsS");
   u00127 : constant Version_32 := 16#57a37a42#;
   pragma Export (C, u00127, "system__address_imageB");
   u00128 : constant Version_32 := 16#bccbd9bb#;
   pragma Export (C, u00128, "system__address_imageS");
   u00129 : constant Version_32 := 16#b5b2aca1#;
   pragma Export (C, u00129, "system__finalization_mastersB");
   u00130 : constant Version_32 := 16#69316dc1#;
   pragma Export (C, u00130, "system__finalization_mastersS");
   u00131 : constant Version_32 := 16#7268f812#;
   pragma Export (C, u00131, "system__img_boolB");
   u00132 : constant Version_32 := 16#e8fe356a#;
   pragma Export (C, u00132, "system__img_boolS");
   u00133 : constant Version_32 := 16#d7aac20c#;
   pragma Export (C, u00133, "system__ioB");
   u00134 : constant Version_32 := 16#8365b3ce#;
   pragma Export (C, u00134, "system__ioS");
   u00135 : constant Version_32 := 16#6d4d969a#;
   pragma Export (C, u00135, "system__storage_poolsB");
   u00136 : constant Version_32 := 16#e87cc305#;
   pragma Export (C, u00136, "system__storage_poolsS");
   u00137 : constant Version_32 := 16#63f11652#;
   pragma Export (C, u00137, "system__storage_pools__subpools__finalizationB");
   u00138 : constant Version_32 := 16#fe2f4b3a#;
   pragma Export (C, u00138, "system__storage_pools__subpools__finalizationS");
   u00139 : constant Version_32 := 16#afc64758#;
   pragma Export (C, u00139, "system__atomic_countersB");
   u00140 : constant Version_32 := 16#d05bd04b#;
   pragma Export (C, u00140, "system__atomic_countersS");
   u00141 : constant Version_32 := 16#f4e1c091#;
   pragma Export (C, u00141, "system__stream_attributesB");
   u00142 : constant Version_32 := 16#221dd20d#;
   pragma Export (C, u00142, "system__stream_attributesS");
   u00143 : constant Version_32 := 16#b2ef2b45#;
   pragma Export (C, u00143, "gnat__directory_operationsB");
   u00144 : constant Version_32 := 16#9cbaa302#;
   pragma Export (C, u00144, "gnat__directory_operationsS");
   u00145 : constant Version_32 := 16#e5480ede#;
   pragma Export (C, u00145, "ada__strings__fixedB");
   u00146 : constant Version_32 := 16#a86b22b3#;
   pragma Export (C, u00146, "ada__strings__fixedS");
   u00147 : constant Version_32 := 16#a8ce4fe7#;
   pragma Export (C, u00147, "gnat__os_libS");
   u00148 : constant Version_32 := 16#e34550ca#;
   pragma Export (C, u00148, "system__pool_globalB");
   u00149 : constant Version_32 := 16#c88d2d16#;
   pragma Export (C, u00149, "system__pool_globalS");
   u00150 : constant Version_32 := 16#9d39c675#;
   pragma Export (C, u00150, "system__memoryB");
   u00151 : constant Version_32 := 16#445a22b5#;
   pragma Export (C, u00151, "system__memoryS");
   u00152 : constant Version_32 := 16#084c16d0#;
   pragma Export (C, u00152, "gnat__regexpS");
   u00153 : constant Version_32 := 16#933fac2f#;
   pragma Export (C, u00153, "system__regexpB");
   u00154 : constant Version_32 := 16#e8a3fa64#;
   pragma Export (C, u00154, "system__regexpS");
   u00155 : constant Version_32 := 16#b4645806#;
   pragma Export (C, u00155, "gnat__stringsS");
   u00156 : constant Version_32 := 16#a5e27155#;
   pragma Export (C, u00156, "generic_linked_listB");
   u00157 : constant Version_32 := 16#a346df94#;
   pragma Export (C, u00157, "generic_linked_listS");
   u00158 : constant Version_32 := 16#fd83e873#;
   pragma Export (C, u00158, "system__concat_2B");
   u00159 : constant Version_32 := 16#1f879351#;
   pragma Export (C, u00159, "system__concat_2S");
   --  BEGIN ELABORATION ORDER
   --  ada%s
   --  ada.characters%s
   --  ada.characters.handling%s
   --  ada.characters.latin_1%s
   --  ada.command_line%s
   --  gnat%s
   --  interfaces%s
   --  system%s
   --  system.address_operations%s
   --  system.address_operations%b
   --  system.atomic_counters%s
   --  system.atomic_counters%b
   --  system.case_util%s
   --  system.case_util%b
   --  system.htable%s
   --  system.img_bool%s
   --  system.img_bool%b
   --  system.img_int%s
   --  system.img_int%b
   --  system.img_lli%s
   --  system.img_lli%b
   --  system.io%s
   --  system.io%b
   --  system.parameters%s
   --  system.parameters%b
   --  system.crtl%s
   --  interfaces.c_streams%s
   --  interfaces.c_streams%b
   --  system.standard_library%s
   --  system.exceptions_debug%s
   --  system.exceptions_debug%b
   --  system.storage_elements%s
   --  system.storage_elements%b
   --  system.stack_checking%s
   --  system.stack_checking%b
   --  system.string_hash%s
   --  system.string_hash%b
   --  system.htable%b
   --  system.strings%s
   --  system.strings%b
   --  gnat.strings%s
   --  system.os_lib%s
   --  gnat.os_lib%s
   --  system.traceback_entries%s
   --  system.traceback_entries%b
   --  ada.exceptions%s
   --  system.soft_links%s
   --  system.unsigned_types%s
   --  system.img_biu%s
   --  system.img_biu%b
   --  system.img_llb%s
   --  system.img_llb%b
   --  system.img_llw%s
   --  system.img_llw%b
   --  system.img_wiu%s
   --  system.img_wiu%b
   --  system.val_int%s
   --  system.val_lli%s
   --  system.val_llu%s
   --  system.val_uns%s
   --  system.val_util%s
   --  system.val_util%b
   --  system.val_uns%b
   --  system.val_llu%b
   --  system.val_lli%b
   --  system.val_int%b
   --  system.wch_con%s
   --  system.wch_con%b
   --  system.wch_cnv%s
   --  system.wch_jis%s
   --  system.wch_jis%b
   --  system.wch_cnv%b
   --  system.wch_stw%s
   --  system.wch_stw%b
   --  ada.exceptions.last_chance_handler%s
   --  ada.exceptions.last_chance_handler%b
   --  system.address_image%s
   --  system.bit_ops%s
   --  system.bit_ops%b
   --  system.compare_array_unsigned_8%s
   --  system.compare_array_unsigned_8%b
   --  system.concat_2%s
   --  system.concat_2%b
   --  system.exception_table%s
   --  system.exception_table%b
   --  ada.io_exceptions%s
   --  ada.strings%s
   --  ada.strings.maps%s
   --  ada.strings.fixed%s
   --  ada.strings.maps.constants%s
   --  ada.strings.search%s
   --  ada.strings.search%b
   --  ada.tags%s
   --  ada.streams%s
   --  ada.streams%b
   --  interfaces.c%s
   --  system.exceptions%s
   --  system.exceptions%b
   --  system.exceptions.machine%s
   --  system.file_control_block%s
   --  system.file_io%s
   --  system.finalization_root%s
   --  system.finalization_root%b
   --  ada.finalization%s
   --  ada.finalization%b
   --  system.storage_pools%s
   --  system.storage_pools%b
   --  system.finalization_masters%s
   --  system.storage_pools.subpools%s
   --  system.storage_pools.subpools.finalization%s
   --  system.storage_pools.subpools.finalization%b
   --  system.stream_attributes%s
   --  system.stream_attributes%b
   --  gnat.directory_operations%s
   --  system.memory%s
   --  system.memory%b
   --  system.standard_library%b
   --  system.pool_global%s
   --  system.pool_global%b
   --  system.secondary_stack%s
   --  system.storage_pools.subpools%b
   --  system.finalization_masters%b
   --  system.file_io%b
   --  interfaces.c%b
   --  ada.tags%b
   --  ada.strings.fixed%b
   --  ada.strings.maps%b
   --  system.soft_links%b
   --  system.os_lib%b
   --  ada.command_line%b
   --  ada.characters.handling%b
   --  system.secondary_stack%b
   --  gnat.directory_operations%b
   --  system.address_image%b
   --  ada.strings.unbounded%s
   --  ada.strings.unbounded%b
   --  system.regexp%s
   --  system.regexp%b
   --  gnat.regexp%s
   --  gnat.command_line%s
   --  system.traceback%s
   --  ada.exceptions%b
   --  system.traceback%b
   --  ada.text_io%s
   --  ada.text_io%b
   --  gnat.command_line%b
   --  ada.text_io.generic_aux%s
   --  ada.text_io.generic_aux%b
   --  ada.text_io.integer_aux%s
   --  ada.text_io.integer_aux%b
   --  ada.integer_text_io%s
   --  ada.integer_text_io%b
   --  box%s
   --  box%b
   --  commandline_args%s
   --  commandline_args%b
   --  generic_linked_list%s
   --  generic_linked_list%b
   --  boites%b
   --  END ELABORATION ORDER


end ada_main;
