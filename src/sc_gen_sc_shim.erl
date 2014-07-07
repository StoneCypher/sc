
-module(sc_gen_sc_shim).





-export([

    arg_list/1,

    fun_forward/3,
    forward_module/1,

    fun_export/2,
    export_module/1

]).





arg_list(N) ->

    sc_list:implode(",", [ "A" ++ integer_to_list(I) || I <- lists:seq(1, N) ]).





fun_forward(Mod, Fun, Arity) -> 

    FMod  = atom_to_list(Mod),
    FName = atom_to_list(Fun),
    FArgs = arg_list(Arity),

    FName ++ "(" ++ FArgs ++ ") -> " ++ FMod ++ ":" ++ FName ++ "(" ++ FArgs ++ ")".





forward_module(Mod) ->

    sc_list:implode(".\n", [ fun_forward(Mod, Fun, Arity) || {Fun, Arity, _, _} <- sc:entrypoints(Mod) ]) ++ ".".





fun_export(Fun, Arity) ->

    atom_to_list(Fun) ++ "/" ++ integer_to_list(Arity).





export_module(Mod) ->

    Cleaned = lists:usort([ {Fu,Ar} || {Fu, Ar, _, _} <- sc:entrypoints(Mod) ]),

    "-export([\n  " ++
    sc_list:implode(",\n  ", [ fun_export(Fun, Arity) || {Fun, Arity} <- Cleaned ])
    ++ "\n]).".
