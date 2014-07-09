
-module(sc_gen_sc_shim).





-export([

    arg_list/1,

    fun_forward/4,
    forward_module/1,

    fun_export/2,
    export_module/1,

    create/2,
    write_to/3

]).





arg_list(N) ->

    sc_list:implode(",", [ "A" ++ integer_to_list(I) || I <- lists:seq(1, N) ]).





fun_forward(Mod, Fun, Arity, Width) -> 

    FMod  = atom_to_list(Mod),
    FName = atom_to_list(Fun),
    FArgs = arg_list(Arity),
    FBase = string:left(FName ++ "(" ++ FArgs ++ ")", Width, $ ),

    FBase ++ " -> " ++ FMod ++ ":" ++ FName ++ "(" ++ FArgs ++ ")".





written_length(Fun, Arity) ->

    length(atom_to_list(Fun)) + length(arg_list(Arity)) + 2.





forward_module(Mod) ->

    FunArity = lists:keysort(1, lists:usort([ {Fun, Arity} || {Fun, Arity, _, _} <- sc:entrypoints(Mod) ])),
    Width    = sc_list:max([ written_length(Fun, Arity) || {Fun, Arity} <- FunArity ]),

    "% Module forwards for " ++ atom_to_list(Mod) ++ ":\n" ++
    sc_list:implode(".\n", [ fun_forward(Mod, Fun, Arity, Width) || {Fun, Arity} <- FunArity ]) ++ ".".





fun_export(Fun, Arity) ->

    atom_to_list(Fun) ++ "/" ++ integer_to_list(Arity).





export_module(Mod) ->

    Cleaned = lists:usort([ {Fu,Ar} || {Fu, Ar, _, _} <- sc:entrypoints(Mod) ]),

    "% Module exports for " ++ atom_to_list(Mod) ++ ":\n  " ++
    sc_list:implode(",\n  ", [ fun_export(Fun, Arity) || {Fun, Arity} <- Cleaned ]).





create(RealMod, ModList) ->

    "\n-module(" ++ atom_to_list(RealMod) ++ ").\n\n\n\n-export([\n\n  "                  ++
    sc:implode(",\n\n  ", [ export_module(Mod)  || Mod <- ModList ]) ++ "\n\n]).\n\n\n\n" ++ 
    sc:implode("\n\n",    [ forward_module(Mod) || Mod <- ModList ]) ++ "\n".





write_to(Target, RealMod, ModList) ->

    file:write_file(Target, create(RealMod, ModList)).
